defmodule TodoWeb.TaskItemController do
  use TodoWeb, :controller
  use Timex

  alias Todo.TaskList.TaskItem
  alias Todo.TaskList

  def index(conn, _params) do
    unfinished_task_items = TaskItem |> TaskList.unfinished
                                     |> TaskList.nearest_to_deadline
                                     |> Repo.all
    finished_task_items   = TaskItem |> TaskList.finished
                                     |> TaskList.nearest_to_deadline
                                     |> Repo.all

    render conn, "index.html", %{
      unfinished_task_items: unfinished_task_items,
      finished_task_items: finished_task_items
    }
  end

  def create(conn, %{"task_item" => task_item_params}) do
    params = Map.update!(task_item_params, "accomplish_at", fn current_value ->
      { :ok, parsed_time } = Timex.parse(current_value, "%Y/%m/%d %H:%M", :strftime)
      parsed_time
    end)

    case TaskList.add_task params do
      { :ok, _ } ->
        conn
        |> put_flash(:info, "Task Item Added")
        |> redirect(to: task_item_path(conn, :index))
      { :error, _ } ->
        conn
        |> put_flash(:error, "Task Item Failed to Add")
        |> redirect(to: task_item_path(conn, :index))
    end
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
