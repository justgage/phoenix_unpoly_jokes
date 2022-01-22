defmodule Jokez.Jokes.Joke do
  use Ecto.Schema
  import Ecto.Changeset

  schema "jokes" do
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(joke, attrs) do
    joke
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
