defmodule BinaService.Repo.Migrations.CreateServiceItems do
  use Ecto.Migration

  def change do
    create table(:service_items, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :qty, :float
      add :uom, :string
      add :description, :string
      add :meta, :string
      add :service_id, references(:services, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:service_items, [:service_id])
  end
end
