defmodule BinaService.Repo.Migrations.CreatePayments do
  use Ecto.Migration

  def change do
    create table(:payments, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :amount, :float
      add :status, :string
      add :reference_number, :string
      add :bill_id, references(:bills, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:payments, [:bill_id])
  end
end
