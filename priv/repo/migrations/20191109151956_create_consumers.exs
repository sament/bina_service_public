defmodule BinaService.Repo.Migrations.CreateConsumers do
  use Ecto.Migration

  def change do
    create table(:consumers, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :tags, :string
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:consumers, [:user_id])
  end
end
