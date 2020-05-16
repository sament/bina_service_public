defmodule BinaService.EventCube.Event do

  @moduledoc """
  @sam_iso
  @PandavilleLabs
  State for event data. YOU ARE TRACKING EVENTS
  Event states: [started, Fulfilling, finished] e.g Sales EventCube (gen_stagem)
  So each event can be staged. So listerners will listen at each stage event

  """

  #defstruct location: nil, actor: nil, command: nil

@name __MODULE__

  @doc """
  Adds a new entity to the event. e.g A new user joins group/event/bus.
  ## Examples
      iex> start(id)
      :ok
  """
def start do
   Agent.start_link(fn -> %{} end, name: @name)
end

  @doc """
  Adds a new entity to the event. e.g A new user joins group/event/bus.
  or
  ## Examples
      iex> add(id, payload)
      :ok
  """
def add(id, payload) do
 Agent.update(@name, &Map.put_new(&1, id, payload))
end


def update(id, payload) do
 Agent.update(@name, &Map.put(&1, id, payload))
end

def stop(id) do
 Agent.update(@name, &Map.delete(&1, id))
end

end


#Allows you host event stream for subscribers to gain access to event data.
#UseCases
#Chat group
#Imagine initiating a sales transaction that is a chain of events where each can be started and ended at scheduled or commanded time



# **********************TIP**************
# *********************************
# **************************
# Telemetry events
# We recommend adapters to publish certain Telemetry events listed below. Those events will use the :telemetry_prefix outlined above which defaults to [:my_app, :repo].

# For instance, to receive all query events published by a repository called MyApp.Repo, one would define a module:

# defmodule MyApp.Telemetry do
#   def handle_event([:my_app, :repo, :query], measurements, metadata, config) do
#     IO.inspect binding()
#   end
# end
# and then attach this module to each event on your Application start callback:

# :telemetry.attach("my-app-handler", [:my_app, :repo, :query], &MyApp.Telemetry.handle_event/4, %{})
