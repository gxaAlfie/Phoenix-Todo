defmodule TodoWeb.TaskItemView do
  use TodoWeb, :view
  use Timex

  def old_unfinished_task?(task_item) do
    is_unfinished   = !task_item.status
    is_old_task     = 1 == Timex.compare(Timex.now, task_item.accomplish_at)

    is_unfinished and is_old_task
  end

  def current_timezone_date do
    "Asia/Manila" |> Timex.now |> Timex.format!("{WDfull}, {Mfull} {D}")
  end

  def relative_time(time) do
    {:ok, relative_time_str} = time |> Timex.format("{relative}", :relative)
    relative_time_str
  end

  def render("update.json", %{ message: message }) do
    %{
      message: message
    }
  end

  def render("delete.json", %{ message: message }) do
    %{
      message: message
    }
  end
end
