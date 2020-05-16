defmodule BinaService.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :status, :string
      add :period_start, :utc_datetime
      add :period_end, :utc_datetime
      add :destination_address, :string
      add :service_id, references(:services, on_delete: :nothing, type: :binary_id)
      add :consumer_id, references(:consumers, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:orders, [:service_id])
    create index(:orders, [:consumer_id])
  end
end
