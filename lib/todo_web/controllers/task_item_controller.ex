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
    params = Map.update!(task_item_params, "accomplish_at", &parse_time_param/1)

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

  def update(conn, %{ "id" => task_item_ids, "status" => status }) do
    number_of_items = Kernel.length task_item_ids
    case TaskList.update_matching_records_status(task_item_ids, status) do
      { ^number_of_items, nil } ->
        conn
        |> put_status(:ok)
        |> render("update.json", message: "Successfully updated #{number_of_items} task/s")
    end
  end

  def update(conn, %{"status" => _status}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render("update.json", message: "Select Items First")
  end

  def delete(conn, %{ "id" => task_item_ids }) do
    number_of_items = Kernel.length task_item_ids
    case TaskList.delete_matching_records(task_item_ids) do
      { ^number_of_items, nil } ->
        conn
        |> put_status(:ok)
        |> render("delete.json", message: "Successfully deleted #{number_of_items} task/s")
    end
  end

  def delete(conn, %{}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render("delete.json", message: "Select Items First")
  end

  defp parse_time_param(time_param) do
    { :ok, parsed_time } = Timex.parse("#{time_param} Asia/Manila", "%Y/%m/%d %H:%M %Z", :strftime)
    parsed_time
  end
end
