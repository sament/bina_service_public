defmodule BinaService.MultiStorage do
  def new(), do: %{}
 def add(storage, key, value) do
    Map.update(
      storage,
      key,
      [value],
      fn values -> [value | values] end
      )
  end

  def get(storage, key) do
    Map.get(storage, key, [])
  end

end


defmodule BinaService.TaskList do
  alias BinaService.MultiStorage

  def new(), do: MultiStorage.new()

  def add(task_list, date, task) do
    MultiStorage.add(task_list, date, task)
  end


  def get(task_list, date) do
    MultiStorage.get(task_list, date)
  end
end

