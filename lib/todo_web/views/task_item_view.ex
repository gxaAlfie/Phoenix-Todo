defmodule TodoWeb.TaskItemView do
  use TodoWeb, :view
  use Timex

  def old_unfinished_task?(task_item) do
    is_unfinished   = !task_item.status
    accomplish_date = task_item.accomplish_at |> DateTime.to_date
    is_old_task     = 1 == Timex.compare(Timex.today, accomplish_date)

    is_unfinished and is_old_task
  end

  def current_timezone_date do
    "Asia/Manila" |> Timex.now |> Timex.format!("{WDfull}, {Mfull} {D}")
  end

  def relative_time(time) do
    {:ok, relative_time_str} = time |> Timex.format("{relative}", :relative)
    relative_time_str
  end
end
