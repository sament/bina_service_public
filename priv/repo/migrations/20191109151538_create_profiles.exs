defmodule BinaService.Repo.Migrations.CreateProfiles do
  use Ecto.Migration

  def change do
    create table(:profiles, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :first_name, :string
      add :last_name, :string
      add :middle_name, :string
      add :profile_details, :string
      add :profile_url, :string
      add :home_address, :string
      add :gender, :string
      add :dob, :date
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:profiles, [:user_id])
  end
end
