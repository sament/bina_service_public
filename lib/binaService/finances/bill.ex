defmodule BinaService.Finances.Bill do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "bills" do
    field :amount, :float
    field :billing_address, :string
    field :details, :string
    field :due_date, :utc_datetime
    field :reference_number, :string
    field :shipping_address, :string
    field :status, :string
    field :tax, :float
    field :terms, :string
    field :order_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(bill, attrs) do
    bill
    |> cast(attrs, [:amount, :status, :reference_number, :tax, :details, :billing_address, :shipping_address, :due_date, :terms])
    |> validate_required([:amount, :status, :reference_number, :tax, :details, :billing_address, :shipping_address, :due_date, :terms])
  end
end
