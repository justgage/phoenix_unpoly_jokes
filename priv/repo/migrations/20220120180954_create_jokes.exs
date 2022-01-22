defmodule Jokez.Repo.Migrations.CreateJokes do
  use Ecto.Migration

  def change do
    create table(:jokes) do
      add :title, :string
      add :body, :text

      timestamps()
    end
  end
end
