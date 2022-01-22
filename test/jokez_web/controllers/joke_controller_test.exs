defmodule JokezWeb.JokeControllerTest do
  use JokezWeb.ConnCase

  import Jokez.JokesFixtures

  @create_attrs %{body: "some body", title: "some title"}
  @update_attrs %{body: "some updated body", title: "some updated title"}
  @invalid_attrs %{body: nil, title: nil}

  describe "index" do
    test "lists all jokes", %{conn: conn} do
      conn = get(conn, Routes.joke_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Jokes"
    end
  end

  describe "new joke" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.joke_path(conn, :new))
      assert html_response(conn, 200) =~ "New Joke"
    end
  end

  describe "create joke" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.joke_path(conn, :create), joke: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.joke_path(conn, :show, id)

      conn = get(conn, Routes.joke_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Joke"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.joke_path(conn, :create), joke: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Joke"
    end
  end

  describe "edit joke" do
    setup [:create_joke]

    test "renders form for editing chosen joke", %{conn: conn, joke: joke} do
      conn = get(conn, Routes.joke_path(conn, :edit, joke))
      assert html_response(conn, 200) =~ "Edit Joke"
    end
  end

  describe "update joke" do
    setup [:create_joke]

    test "redirects when data is valid", %{conn: conn, joke: joke} do
      conn = put(conn, Routes.joke_path(conn, :update, joke), joke: @update_attrs)
      assert redirected_to(conn) == Routes.joke_path(conn, :show, joke)

      conn = get(conn, Routes.joke_path(conn, :show, joke))
      assert html_response(conn, 200) =~ "some updated body"
    end

    test "renders errors when data is invalid", %{conn: conn, joke: joke} do
      conn = put(conn, Routes.joke_path(conn, :update, joke), joke: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Joke"
    end
  end

  describe "delete joke" do
    setup [:create_joke]

    test "deletes chosen joke", %{conn: conn, joke: joke} do
      conn = delete(conn, Routes.joke_path(conn, :delete, joke))
      assert redirected_to(conn) == Routes.joke_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.joke_path(conn, :show, joke))
      end
    end
  end

  defp create_joke(_) do
    joke = joke_fixture()
    %{joke: joke}
  end
end
