defmodule BinaService.Tasks do
 use GenServer

 #Convenience functions for working with tasks/schedule.

 def init(tasklist) do
  {:ok, tasklist}
 end

#@spect start_link(%{}):: {error, any} | {:ok, pid}
def start_link(tasklist) do
  state =
  %{tasklist: tasklist}
   GenServer.start_link(__MODULE__, state, name: __MODULE__)
end


def add_task(pid, task) do
  GenServer.call(pid, {:add_task, task})
end


def handle_call(:add_task, _from, [head | tail]) do
  {:reply, head, tail}
end




end



defmodule Stack do
  use GenServer

  # Client

  def start_link(default) when is_list(default) do
    GenServer.start_link(__MODULE__, default)
  end

  def push(pid, item) do
    GenServer.cast(pid, {:push, item})
  end

  def pop(pid) do
    GenServer.call(pid, :pop)
  end

  # Server (callbacks)

  @impl true
  def init(stack) do
    {:ok, stack}
  end

  @impl true
  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  @impl true
  def handle_cast({:push, item}, state) do
    {:noreply, [item | state]}
  end


end
