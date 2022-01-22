defmodule JokezWeb.JokeView do
  use JokezWeb, :view

  alias Jokez.Jokes

  def list_jokes() do
    Jokes.list_jokes()
  end
end
