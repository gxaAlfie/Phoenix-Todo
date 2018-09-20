defmodule Todo.TaskList do
  @moduledoc """
  Boundary for the Task List System
  """

  use Todo, :generic_context

  import Ecto.{ Changeset }
  alias Todo.TaskList.TaskItem

  def add_task(attrs \\ %{}) do
    %TaskItem{}
    |> task_item_changeset(attrs)
    |> Repo.insert()
  end

  defp task_item_changeset(%TaskItem{} = task_item, attrs) do
    task_item
    |> cast(attrs, [:name, :accomplish_at, :description, :status])
  end
end
