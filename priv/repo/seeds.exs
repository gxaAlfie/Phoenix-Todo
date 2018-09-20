# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Todo.Repo.insert!(%Todo.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
#
alias Todo.TaskList

use Timex

finished_tasks = ["Do Laundry", "Cook Breakfast", "Buy Groceries"]
unfinished_tasks = ["Walk Dog", "Get Car Washed"]

for unfinished_task <- unfinished_tasks do
  TaskList.add_task(%{ name: unfinished_task, description: "", accomplish_at: Timex.now })
end

for finished_task <- finished_tasks do
  TaskList.add_task(%{ name: finished_task, description: "", accomplish_at: Timex.now, status: true })
end
