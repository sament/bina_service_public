defmodule BinaService.Sales.Order do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "orders" do
    field :destination_address, :string
    field :period_end, :utc_datetime
    field :period_start, :utc_datetime
    field :status, :string
    field :service_id, :binary_id
    field :consumer_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:service_id, :consumer_id, :status, :period_start, :period_end, :destination_address])
    |> validate_required([:service_id,:consumer_id,:status,:period_start, :period_end, :destination_address])
  end

  def bot_order_changeset(order, attrs) do
    order
    |>cast(attrs, [:service_id, :consumer_id, :status, :period_start, :period_end, :destination_address])#how do I use constants/sigils like @all_fields than specify each?
    |> validate_required([:service_id, :consumer_id,  :period_start, :period_end ])
  end
end
