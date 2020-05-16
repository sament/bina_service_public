defmodule BinaService.Sales.Enity.Providers do

#Use Bina.Provider
#The data properties and functions available for this entity.
#In OOP this will be a class
#RULE: Never set initial states to Entities so as to support the live or die state of this object
# Use cases:
# Cached Agent: A process can represent the state of a given process at a time

# or ETS struct
# and aggregate root(Exposure) of this API to the outside world
   defstruct [
              id: nil,
              user_id: nil,
              name: nil,
              tags: nil,
              inserted_at: nil,
              created_at: nil
        ]


  #ATOM ENTITY BEHAVIOURS
  # This behaviour is to be defined in the
  # behaviour module
  # that abstracts th logic/condition/behaviour for this
  # METHODS

  alias BinaService.Sales

  def start_link (id)  do
    # cache will be nil if we are testing
     {:ok, provider} = Sales.get_provider!(id)
     Agent.start_link(fn -> %__MODULE__{} = provider end, name: __MODULE__)
  end




  # import Ecto.Query

  #   # want
  #   # SELECT max(temp_lo) FROM weather;

  #   query = from(w in Weather, select: max(w.temp_lo))
  #   Repo.one(query)

  #   # is actually
  #   # SELECT max(w0."temp_lo") FROM "weather" AS w0 []


end
