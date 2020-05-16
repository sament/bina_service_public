defmodule BinaService.Sales.ServiceItem do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "service_items" do
    field :description, :string
    field :meta, :string
    field :qty, :float
    field :uom, :string
    field :service_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(service_item, attrs) do
    service_item
    |> cast(attrs, [:qty, :uom, :description, :meta])
    |> validate_required([:qty, :uom, :description, :meta])
  end
end
