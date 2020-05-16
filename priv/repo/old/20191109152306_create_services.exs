defmodule BinaService.Repo.Migrations.CreateServices do
  use Ecto.Migration

  def change do
    create table(:services, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :details, :string
      add :description, :string
      add :tags, :string
      add :provider_id, references(:providers, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:services, [:provider_id])
  end
end
