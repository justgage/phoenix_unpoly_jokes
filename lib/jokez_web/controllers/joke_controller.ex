defmodule JokezWeb.JokeController do
  use JokezWeb, :controller

  alias Jokez.Jokes
  alias Jokez.Jokes.Joke

  def index(conn, _params) do
    jokes = Jokes.list_jokes()
    render(conn, "index.html", jokes: jokes)
  end

  def new(conn, _params) do
    changeset = Jokes.change_joke(%Joke{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"joke" => joke_params}) do
    case Jokes.create_joke(joke_params) do
      {:ok, joke} ->
        conn
        |> put_flash(:info, "Joke created successfully.")
        |> redirect(to: Routes.joke_path(conn, :show, joke))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    joke = Jokes.get_joke!(id)
    render(conn, "show.html", joke: joke)
  end

  def edit(conn, %{"id" => id}) do
    joke = Jokes.get_joke!(id)
    changeset = Jokes.change_joke(joke)
    render(conn, "edit.html", joke: joke, changeset: changeset)
  end

  def update(conn, %{"id" => id, "joke" => joke_params}) do
    joke = Jokes.get_joke!(id)

    case Jokes.update_joke(joke, joke_params) do
      {:ok, joke} ->
        conn
        |> put_flash(:info, "Joke updated successfully.")
        |> redirect(to: Routes.joke_path(conn, :show, joke))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", joke: joke, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    joke = Jokes.get_joke!(id)
    {:ok, _joke} = Jokes.delete_joke(joke)

    conn
    |> put_flash(:info, "Joke deleted successfully.")
    |> redirect(to: Routes.joke_path(conn, :index))
  end
end
