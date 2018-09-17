defmodule Todo.Repo.Migrations.AddAccomplishAtToTaskItemsTable do
  use Ecto.Migration

  def change do
    alter table :task_items do
      add :accomplish_at, :utc_datetime
    end
  end
end
