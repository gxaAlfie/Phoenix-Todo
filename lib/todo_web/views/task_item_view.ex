defmodule TodoWeb.TaskItemView do
  use TodoWeb, :view
  use Timex

  def current_timezone_date do
    "Asia/Manila" |> Timex.now |> Timex.format!("{WDfull}, {Mfull} {D}")
  end

  def relative_time(time) do
    {:ok, relative_time_str} = time |> Timex.format("{relative}", :relative) 
    relative_time_str
  end
end
