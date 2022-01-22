defmodule Jokez.JokesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Jokez.Jokes` context.
  """

  @doc """
  Generate a joke.
  """
  def joke_fixture(attrs \\ %{}) do
    {:ok, joke} =
      attrs
      |> Enum.into(%{
        body: "some body",
        title: "some title"
      })
      |> Jokez.Jokes.create_joke()

    joke
  end
end
