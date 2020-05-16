defmodule BinaService.EventCube.Sequencer do
  use GenServer
  #Group's functions to be executed in sequential order.
  #But for now this module simply keeps count
  @name __MODULE__

  def start_link(initial_number) do
    GenServer.start_link(@name, initial_number, name: @name)
  end

  def init(initial_number) do
    {:ok, initial_number}
  end

  # def next_number do
  #   GenServer.call(@name,{:next_number})
  # end

  def handle_call(:next_number, _fom, current_number) do
    {:reply, current_number, current_number + 1}
  end




end
