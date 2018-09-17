defmodule Todo.Repo.Migrations.CreateTaskItemsTable do
  use Ecto.Migration

  def change do
    create table :task_items do
      add :name, :string
      add :description, :text

      timestamps()
    end

    create unique_index(:task_items, [:name])
  end
end
