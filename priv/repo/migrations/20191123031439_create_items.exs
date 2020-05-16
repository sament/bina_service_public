defmodule BinaService.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :description, :string
      add :status, :string
      add :uom, :string
      add :attributes, :string
      add :owner, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:items, [:owner])
  end
end
