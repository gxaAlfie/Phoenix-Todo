defmodule Todo.Repo.Migrations.RemoveDescriptionFromTaskItemsTable do
  use Ecto.Migration

  def change do
    alter table :task_items do
      remove :description
    end
  end
end
