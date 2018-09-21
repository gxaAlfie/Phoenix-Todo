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

  def add_task(attrs \\ %{}) do
    %TaskItem{}
    |> task_item_changeset(attrs)
    |> unique_constraint(:name)
    |> Repo.insert()
  end

  defp task_item_changeset(%TaskItem{} = task_item, attrs) do
    task_item
    |> cast(attrs, [:name, :accomplish_at, :status])
  end
end
