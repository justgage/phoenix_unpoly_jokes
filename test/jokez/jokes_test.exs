defmodule Jokez.JokesTest do
  use Jokez.DataCase

  alias Jokez.Jokes

  describe "jokes" do
    alias Jokez.Jokes.Joke

    import Jokez.JokesFixtures

    @invalid_attrs %{body: nil, title: nil}

    test "list_jokes/0 returns all jokes" do
      joke = joke_fixture()
      assert Jokes.list_jokes() == [joke]
    end

    test "get_joke!/1 returns the joke with given id" do
      joke = joke_fixture()
      assert Jokes.get_joke!(joke.id) == joke
    end

    test "create_joke/1 with valid data creates a joke" do
      valid_attrs = %{body: "some body", title: "some title"}

      assert {:ok, %Joke{} = joke} = Jokes.create_joke(valid_attrs)
      assert joke.body == "some body"
      assert joke.title == "some title"
    end

    test "create_joke/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Jokes.create_joke(@invalid_attrs)
    end

    test "update_joke/2 with valid data updates the joke" do
      joke = joke_fixture()
      update_attrs = %{body: "some updated body", title: "some updated title"}

      assert {:ok, %Joke{} = joke} = Jokes.update_joke(joke, update_attrs)
      assert joke.body == "some updated body"
      assert joke.title == "some updated title"
    end

    test "update_joke/2 with invalid data returns error changeset" do
      joke = joke_fixture()
      assert {:error, %Ecto.Changeset{}} = Jokes.update_joke(joke, @invalid_attrs)
      assert joke == Jokes.get_joke!(joke.id)
    end

    test "delete_joke/1 deletes the joke" do
      joke = joke_fixture()
      assert {:ok, %Joke{}} = Jokes.delete_joke(joke)
      assert_raise Ecto.NoResultsError, fn -> Jokes.get_joke!(joke.id) end
    end

    test "change_joke/1 returns a joke changeset" do
      joke = joke_fixture()
      assert %Ecto.Changeset{} = Jokes.change_joke(joke)
    end
  end
end
