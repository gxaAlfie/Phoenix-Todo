defmodule Todo.Repo.Migrations.AddStatusToTaskItemsTable do
  use Ecto.Migration

  def change do
    alter table :task_items do
      add :status, :boolean, default: false
    end
  end
end
