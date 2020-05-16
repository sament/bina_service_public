defmodule BinaService.Finances.Payment do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "payments" do
    field :amount, :float
    field :reference_number, :string
    field :status, :string
    field :bill_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(payment, attrs) do
    payment
    |> cast(attrs, [:amount, :status, :reference_number, :bill_id])
    |> validate_required([:amount, :status, :reference_number, :bill_id])
  end
end
