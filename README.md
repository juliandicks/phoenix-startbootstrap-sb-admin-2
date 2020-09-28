# phoenix-startbootstrap-sb-admin-2
Starter template for anybody wanting to get elixir/phoenix/live running with the startbootstrap sb-admin-2 template

To start your Phoenix server:
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

# Steps
### pre-requisites
1. install asdf
1. asdf install erlang 23.1
1. asdf install elixir 1.10.4-otp-23

### script
1. asdf local erlang 23.1
1. asdf local elixir 1.10.4-otp-23
1. mix archive.install hex phx_new
1. mix phx.new .  --app demo --live
1. cd assets && npm install && node node_modules/webpack/bin/webpack.js --mode development && cd ..
1. mix ecto.create
1. mix phx.server
1. added ex_effective_bootstrap 
1. pain and suffering
