defmodule Formv.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :name, :string
      add :age, :integer

      timestamps()
    end
  end
end
