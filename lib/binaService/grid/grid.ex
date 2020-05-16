defmodule BinaService.Grid do
  use Supervisor
 @moduledoc """
  @Author:samdoxiso@gmail.com
  Desc: This is a supervisor process that manages a number of slots(digital containers)
  A grid starts with 25 slots
  """

  @name __MODULE__
  @default_number_of_slots 8  #@maximum_x 5 \\ @maximum_y 5

  alias BinaService.Grid.Slot


  def start_link(slots_count \\ @default_number_of_slots) do
    initial_state = %{"pid" => self(), "slots" => slots_count}
    # initial_state = {"pid" => self(), "slots" => number_of_slots}
    Supervisor.start_link(@name, {:ok,initial_state}, name: @name)
  end

  def children_count do
    Supervisor.count_children(@name)
  end

  def init({:ok, %{"slots" => slots_count}}) do
    IO.puts "max coord"
    max_coord = {:erlang.floor(slots_count/2),:erlang.floor(slots_count/2)}
    |> IO.inspect
    generate_slots_specs(max_coord)
    |> Supervisor.init(strategy: :one_for_one)
    #@samdoxiso@gmail.com
     #:one_for_one - if a slot process terminates, only that slot is restarted.
  end

  # def get_records(id, coordinates) do
  #   coordinates
  #   |>generate_slot_name
  #   |>Slot.get(id)
  #   #Returns nil if id isn't present in slot{x,y}
  # end

  def join(id, coordinates) do
    coordinates
    |>generate_slot_name
    |>Slot.join(id, coordinates)
  end

  def move(id, coordinates) do
    coordinates
    |>generate_slot_name
    |>Slot.move(id, coordinates)
  end

  def leave(id, coordinates) do
    coordinates
    |>generate_slot_name
    |>Slot.leave(id)
  end

  def nearby(coordinates, radius \\ 10) do
    surrounding(coordinates, radius)
    |> Enum.map(&Task.async(Slot, :nearby, [&1, coordinates, radius]))
    |> Enum.flat_map(&Task.await/1)
    |> Enum.sort(&comparator/2)
  end


  defp generate_slot_name({x,y}) do
    :"slot-#{:erlang.floor(x)}-#{:erlang.floor(y)}"
  end

  defp generate_slots_specs({maximum_x,maximum_y}) do
    for x <-0..maximum_x, y <- 0..maximum_y do
      coordinates = {x, y}
      name = generate_slot_name(coordinates)
      %{
        id: name,
        start: {Slot, :start_link, [name, coordinates]}
      }
    end
  end

  defp comparator({_, _, a}, {_, _, b}), do: a <= b

  defp surrounding({x,y}, radius) do
    for i <- :erlang.floor(x - radius)..:erlang.floor(x + radius + 1),
    j <- :erlang.floor(y - radius)..:erlang.floor(y + radius + 1) do
      generate_slot_name({i, j})
    end
  end

end
