defmodule Todo.TaskList do
  @moduledoc """
  Boundary for the Task List System
  """

  use Todo, :generic_context

  import Ecto.{ Changeset }
  import Ecto.Query, only: [from: 2]
  alias Todo.TaskList.TaskItem

  def nearest_to_deadline(query) do
    from task_items in query,
      order_by: [desc: :accomplish_at]
  end

  def finished(query) do
    from task_item in query,
      where: task_item.status == true
  end

  def unfinished(query) do
    from task_item in query,
      where: task_item.status == false
  end

  def update_matching_records_status(ids, status) do
    TaskItem |> fetch_records_by_id(ids)
             |> Repo.update_all(set: [status: !(String.to_existing_atom(status))])
  end

  def delete_matching_records(ids) do
    TaskItem |> fetch_records_by_id(ids)
             |> Repo.delete_all
  end

  def add_task(attrs \\ %{}) do
    %TaskItem{} |> task_item_changeset(attrs)
                |> unique_constraint(:name)
                |> validate_required([:name, :accomplish_at])
                |> Repo.insert()
  end

  defp task_item_changeset(%TaskItem{} = task_item, attrs) do
    task_item |> cast(attrs, [:name, :accomplish_at, :status])
  end

  defp fetch_records_by_id(query, ids) do
    from task_item in query,
      where: task_item.id in ^ids
  end
end
