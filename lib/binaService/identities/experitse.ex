defmodule BinaService.Identities.Expertise do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "expertise" do
    field :name, :string
    field :description, :string
    field :meta, :string

    timestamps()
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [:name, :description, :meta])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
