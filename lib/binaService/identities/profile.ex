defmodule BinaService.Identities.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "profiles" do
    field :dob, :date
    field :first_name, :string
    field :expertise_id, :binary_id
    field :gender, :string
    field :home_address, :string
    field :last_name, :string
    field :middle_name, :string
    field :profile_details, :string
    field :profile_url, :string
    field :user_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [:user_id, :first_name, :last_name, :middle_name, :profile_details, :profile_url, :home_address, :gender, :dob])
    |> validate_required([:first_name, :last_name,
    :middle_name, :profile_details, :profile_url,
     :home_address, :gender, :dob])
    |> unique_constraint(:user_id)
  end
end
