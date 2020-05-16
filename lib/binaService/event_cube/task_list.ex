defmodule BinaService.EventCube.TaskList do
  alias BinaService.EventCube.TaskList

  defstruct id: 0, entries: {}

  def new(entries \\ []) do
    Enum.reduce(
      entries,
      %TaskList{},
      fn entry, acc -> add_task(acc, entry) end
    )
  end

  def add_task(task_list, entry) do
    entry = Map.put(entry, :id, task_list.id)#add an id field with tasklist id into entry
    |> IO.inspect

    #adds the new entry to list of entries inside task list
    new_entries =
    Map.put(
      task_list.entries,
      task_list.id,
      entry
    )

    #updates the  TaskList with the new_entries and update the id counter on TaskList to +1 so the next TaskList entry increases by 1

    %TaskList{
      task_list
      | entries: new_entries,
      id: task_list.id + 1
    }

  end

  def get_tasks(task_list, date) do
    task_list.entries
    |> Stream.filter(fn {_, entry} -> entry.date == date end)
    |> Enum.map(fn {_, entry} -> entry end)
  end

  def update_task(task_list, %{} = new_entry) do #Ensures new_entry is a map
    update_task(task_list, new_entry.id, fn _ -> new_entry end)
  #fn _old_entry -> new_entry
  end

  def update_task(task_list, entry_id, update_fn) do
    case Map.fetch(task_list.entries, entry_id) do
      :error ->
        task_list

      {:ok, old_entry} ->
        new_entry =update_fn.(old_entry)

        new_entries =
        Map.put(
          task_list.entries,
          new_entry.id,
          new_entry
        )

        %TaskList{task_list | entries: new_entries}
    end
  end
end




# alias BinaService.EventCube.TaskList


# tl1 = %TaskList{
#   entries: %{
#     0 => %{date: ~D[2019-02-04], id: 0, title: "Arina Announcement"}
#   },
#   id: 1
# }

# tl1c = TaskList.add_task(tl1,
# %{date: Date.add(Date.utc_today(), 30), id: 3,
# title: "Arina Hackathon"})


#  tl1c1 = TaskList.add_task(tl1c, %{date: Date.add(Date.utc_today(), 60), id: 0, title: "Arina Hackathon II"})
# ==>
# %{date: ~D[2020-02-25], id: 2, title: "Arina Hackathon II"}
# %BinaService.EventCube.TaskList{
#   entries: %{
#     0 => %{date: ~D[2019-02-04], id: 0, title: "Arina Announcement"},
#     1 => %{date: ~D[2020-01-26], id: 1, title: "Arina Hackathon"},
#     2 => %{date: ~D[2020-02-25], id: 2, title: "Arina Hackathon II"}
#   },
#   id: 3
# }

# when CostManager\\MoneyBaba is applied to this it adds {:cost*} tupple into entries


# iex(10)> tl1c1
# %BinaService.EventCube.TaskList{
#   entries: %{
#     0 => %{date: ~D[2019-02-04], id: 0, title: "Arina Announcement"},
#     1 => %{date: ~D[2020-01-26], id: 1, title: "Arina Hackathon"},
#     2 => %{date: ~D[2020-02-25], id: 2, title: "Arina Hackathon II"}
#   },
#   id: 3
# }


# iex(13)> TaskList.get_tasks(tl1c1, Date.add(Date.utc_today(),30))
# [%{date: ~D[2020-01-26], id: 1, title: "Arina Hackathon"}]
# iex(14)>


#TODO:
#Send to Slot addres.
# It becomes a new message for that process(which then uses websocket to pass to clients listening)
#  vyuv
#

# defmodule MyApp.Periodically do
#   use GenServer

#   def start_link(_) do
#     GenServer.start_link(__MODULE__, %{})
#   end

#   @impl true
#   def init(state) do
#     # Schedule work to be performed on start
#     schedule_work()
#     {:ok, state}
#   end

#   @impl true
#   def handle_info(:work, state) do
#     # Do the desired work here
#     ...

#     # Reschedule once more
#     schedule_work()

#     {:noreply, state}
#   end

#   defp schedule_work do
#     # In 2 hours
#     Process.send_after(self(), :work, 2 * 60 * 60 * 1000)
#   end
# end
