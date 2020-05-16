

# defmodule BinaService.Grid.Slot_OLD do
# #  @name __MODULE__
# use Agent

#  def start_link(name, _coordinates) do
#     Agent.start_link(fn -> %{} end, name: name)
#  end

#  def join(name, id, coordinates) do

#     Agent.update(name, &Map.put_new(&1, id, coordinates))

#  end

#  def move(name, id, coordinates) do
#   Agent.update(name, &Map.put(&1, id, coordinates))
#  end

#  def leave(name, id) do
#   Agent.update(name, &Map.delete(&1, id))
#  end


#  def nearby(name, coordinates, radius) do
#   Agent.get(name, &find(&1, coordinates, radius))
#  end

#  def records(name) do
#   Agent.get(name, fn(data) -> data end)
# end

# defp find(state, origin, radius) do
#   state
#   |> Enum.into([])
#   |> Enum.map(fn {id, coordinates} -> {id, coordinates.distance(origin, coordinates)} end)
#   # |> Enum.filter(fn {_,_, distance} -> distance <- radius end)
# end


# defp distance({x1,y1},{x2,y2}) do
#   :math.sqrt(:math.pow(x2-x1,2) + :math.pow(y2-y1,2))
# end

# # def get(id) do
# #   records()
# #   |> Enum.find(fn(meal) -> meal.id == id end)
# # end

# @spec get(atom | pid | {atom, any} | {:via, atom, any}, any) :: any
# def get(name, id) do
#  Map.get(records(name), id)
# end

# end






# defmodule BinaService.Grid.Slot.Sample do

# # @sam_iso

# alias BinaService.Grid

#     def run_supo(slots_x \\ 8) do

#        IO.puts "grid: starting"
#       Grid.start_link(slots_x) |> IO.inspect


#       :sys.trace(:"slot-0-1", true)
#       :sys.trace(:"slot-0-2", true)

#       :sys.trace(:"slot-1-1", true)
#       :sys.trace(:"slot-1-2", true)
#       #TODO: Actors can subscribe to slots to listen for events on slots
#       #Validate that slot exists(is live) before anyone can join or return  error


#       IO.puts "sam: joins grid at slot{1,1}"
#       Grid.join(:sam, {1, 1}) |> IO.inspect

#       IO.puts "toyosi: joins grid at slot{0,1}"
#       Grid.join(:toyosi, {0, 1}) |> IO.inspect

#       IO.puts "toyosi: is on the move to slot{1, 1} || Joins sam"
#       Grid.join(:toyosi, {1, 1}) |> IO.inspect

#       IO.puts "toyosi: is leaving slot{0, 1}"
#       Grid.leave(:toyosi, {0, 1}) |> IO.inspect

#     end

#     def run_group do

#       # IO.puts "grid: starting"
#       # Slot.start_link |> IO.inspect

#       # IO.puts "green: joins grid"
#       # Slot.join(:green, {10, 20}) |> IO.inspect

#       # IO.puts "blue: joins grid"
#       # Slot.join(:blue, {11, 20}) |> IO.inspect

#       # IO.puts "blue: is on the move"
#       # Slot.join(:blue, {11, 21}) |> IO.inspect

#       # IO.puts "blue: is leaving grid"
#       # Slot.leave(:blue) |> IO.inspect

#     end

# end



# defmodule BinaService.Grid.SlotX do

# defstruct maximum_occupant: :infinity

# end



