defmodule Todo.TaskList.TaskItem do
  use Ecto.Schema

  schema "task_items" do
    field :name, :string
    field :description, :string
    field :accomplish_at, :utc_datetime
    field :status, :boolean

    timestamps()
  end
end
