defmodule BinaService.Sales.Item do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "items" do
    field :attributes, :string
    field :description, :string
    field :name, :string
    field :status, :string
    field :uom, :string
    field :owner, :binary_id

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:name, :description, :status, :uom, :attributes])
    |> validate_required([:name, :description, :status, :uom, :attributes])
  end
end
