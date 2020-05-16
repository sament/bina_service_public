defmodule BinaService.Repo do
  use Ecto.Repo,
    otp_app: :binaService,
    adapter: Ecto.Adapters.Postgres

    defoverridable [get!: 2, get!: 3]
    def get!(entity, id) do
      IO.inspect "overrided called"
       super(entity, id)
     rescue
       Ecto.Query.CastError -> nil
       Ecto.NoResultsError -> nil

     end

  #   defoverridable [get: 2, get: 3]
  #  def get(query, id, opts \\ []) do
  #     super(query, id, opts)
  #   rescue
  #     Ecto.Query.CastError -> nil
  #   end
end

defmodule BinaService.Repo.Q do
# Imports only from/2 of Ecto.Query
import Ecto.Query, only: [from: 2]

alias BinaService.Repo

  def is_table(name) do

      # Create a query
      query = from u in name,
                select: u

      # Send the query to the repository
      Repo.all(query)
      # This seems to be a heavy operation. What happens when DB hits 1,000 records it starts getting more expsensive to check table name
      # Find another way of getting it from an eldready loaded place

      # Repo.all(Ecto.Query.from c in "consumers", select: c.name)

  end
end
