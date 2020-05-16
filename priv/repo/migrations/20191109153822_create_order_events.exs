defmodule BinaService.Repo.Migrations.CreateOrderEvents do
  use Ecto.Migration

  def change do
    create table(:order_events, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :action, :string
      add :status, :string
      add :meta, :string
      add :message, :string
      add :timestamp, :utc_datetime
      add :order_id, references(:orders, on_delete: :nothing, type: :binary_id)
      add :actor_id, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:order_events, [:order_id])
    create index(:order_events, [:actor_id])
  end
end
