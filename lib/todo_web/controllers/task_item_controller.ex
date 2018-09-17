defmodule TodoWeb.TaskItemController do
  use TodoWeb, :controller
  alias Todo.Repo
  alias TodoWeb.TaskItem
  use Timex

  def index(conn, _params) do
    task_items = TaskItem |> group_by([:id, :status])
                          |> order_by([asc: :status, desc: :accomplish_at])
                          |> Repo.all
    render conn, "index.html", task_items: task_items
  end

  @doc """
  If I need to implement update this is how i did it in iex though need
  to adjust controller function
  """
  # def update(conn, _params)
  #   task_item = Repo.get(TaskItem, <id>)
  #   task_item = Ecto.Changeset.change, <map of items to change>
  #   Repo.update task_item => this will return {:ok, task_item} if we need to match
  # end
end
