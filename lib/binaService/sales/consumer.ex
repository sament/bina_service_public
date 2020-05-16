defmodule BinaService.Sales.Consumer do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "consumers" do
    field :name, :string
    field :tags, :string
    field :user_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(consumer, attrs) do
    consumer
    |> cast(attrs, [:name, :tags])
    |> validate_required([:name, :tags])
  end
end
