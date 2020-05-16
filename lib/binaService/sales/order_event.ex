defmodule BinaService.Sales.OrderEvent do
  use Ecto.Schema
  import Ecto.Changeset


  # This can help us capture audit trail using the :action keyword.
  # It can capture inventory movement by
  # digging further into ORDER & SERVICE_ITEM we can deduce the transaction

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "order_events" do
    field :action, :string
    field :message, :string
    field :meta, :string
    field :status, :string
    field :timestamp, :utc_datetime
    field :order_id, :binary_id
    field :actor_id, :binary_id #A user

    timestamps()
  end

  @doc false
  def changeset(order_event, attrs) do
    order_event
    |> cast(attrs, [:action, :status, :meta, :message, :timestamp])
    |> validate_required([:action, :status, :meta, :message, :timestamp])
  end
end
