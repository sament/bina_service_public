defmodule BinaService.Sales.Service do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "services" do
    field :description, :string
    field :details, :string
    field :name, :string
    field :slots, :integer
    field :tags, :string
    field :provider_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(service, attrs) do
    service
    |> cast(attrs, [:name, :details, :description, :tags, :slots])
    |> validate_required([:name, :details, :description, :tags, :slots])
  end
end
