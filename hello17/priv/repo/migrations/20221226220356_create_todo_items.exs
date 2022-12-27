defmodule Hello17.Repo.Migrations.CreateTodoItems do
  use Ecto.Migration

  def change do
    create table(:todo_items) do
      add :text, :string

      timestamps()
    end
  end
end
