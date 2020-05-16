defmodule BinaService.Repo.Migrations.CreateBills do
  use Ecto.Migration

  def change do
    create table(:bills, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :amount, :float
      add :status, :string
      add :reference_number, :string
      add :tax, :float
      add :details, :string
      add :billing_address, :string
      add :shipping_address, :string
      add :due_date, :utc_datetime
      add :terms, :string
      add :order_id, references(:orders, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:bills, [:order_id])
  end
end
