defmodule TodoWeb.TaskItem do
  use TodoWeb, :model

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, ~w(name accomplish_at description status), [])
  end

  schema "task_items" do
    field :name, :string
    field :description, :string
    field :accomplish_at, :utc_datetime
    field :status, :boolean

    timestamps()
  end
end
