
defmodule BinaService.Grid.Slot do
  use GenServer


  # name, origin(coordinate) and records are the properties of slot in the grid

  def start_link(name, origin) do
    state = %{
      name: name,
      origin: origin,
      records: %{}
    }
    GenServer.start_link(__MODULE__, state, name: name)
  end

  def init(state) do
    {:ok, state}
  end




  #// CLIENT

  def join(slot, pid, coordinates) do
    GenServer.call(slot, {:join, pid, coordinates})
  end

  def move(slot, pid, coordinates) do
    GenServer.call(slot, {:move, pid, coordinates})
  end

  def leave(slot, pid) do
    GenServer.call(slot, {:leave, pid})
  end

  def nearby(slot, coordinates, radius) do
    GenServer.call(slot, {:nearby, coordinates, radius})
  end

  def handle_call({:join, pid, coordinates}, _from, state) do
    record = %{
      position: coordinates,
      ref: Process.monitor(pid)
    }

    {:reply, :ok, put_in(state[:records][pid], record)}
    #updates the current position(coord) of the actor/object/item(pid)

    # put_in(state/map, value):  Puts a value in a nested structure.
 ## Examples

#  iex> users = %{"john" => %{age: 27}, "meg" => %{age: 23}}
#  iex> put_in(users["john"][:age], 28)
#  %{"john" => %{age: 28}, "meg" => %{age: 23}}

  end

  def handle_call({:move, pid, coordinates}, _from, state) do
    {:reply, :ok, put_in(state[:records][pid][:position], coordinates)}
  end

  def handle_call({:leave, pid}, _from, state) do
    record = state.records[pid]
    Process.demonitor(record.ref)
    {:reply, state, state}
  end

  def handle_call({:nearby, coordinates, radius}, _from, state) do
    nearby = find(state.records, coordinates, radius)
    {:reply, nearby, state}
  end

  def handle_call({:DOWN, _ref, :process, pid, _reason}, state) do
    {:noreply, %{state | records: Map.delete(state.records, pid)}}
  end

  defp find(state, origin, radius) do
    state > IO.inspect()
    |> Enum.into([])
    |> Enum.map(fn {id, coordinates} -> {id, coordinates.distance(origin, coordinates)} end)
    |> Enum.filter(fn {_,_, distance} -> distance <= radius end)
  end

  defp distance({x1,y1},{x2,y2}) do
    :math.sqrt(:math.pow(x2-x1,2) + :math.pow(y2-y1,2))
  end



end

