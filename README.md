# Jokez using Elixir's [Phoenix](https://www.phoenixframework.org/) and [Unpoly](https://unpoly.com/)

👉🏻 Youtube Video: https://www.youtube.com/watch?v=2-5dwrkckVk

Can we copy the [Remix.run](https://remix.run/) [Jokes App](https://remix-jokes.lol/) in 15 minutes using a plain old server rendered HTML? Yes we can! Well I didn't worry about the CSS but the functionality is basically the same IMO. I'll probably add CSS latter to make it more convincing.

It also features:

- Caching data of pages you already visited
- Preloading links to the next page on hover
- Easily putting pages into modals with only 2 HTML attributes

Mostly made possible by [Unpoly](https://unpoly.com/)

## How to Run

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix
