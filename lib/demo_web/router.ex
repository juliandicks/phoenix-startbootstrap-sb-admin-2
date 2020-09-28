defmodule DemoWeb.Router do
  use DemoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {DemoWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DemoWeb do
    pipe_through :browser

    live "/", PageLive, :index

    get "/bootstrap", BootstrapController, :index
    get "/bootstrap/reset", BootstrapController, :reset
    get "/bootstrap/effective", BootstrapController, :effective
    get "/bootstrap/sb_admin_2", BootstrapController, :sb_admin_2

    get "/sb_admin2", SbAdmin2Controller, :index
    get "/sb_admin2/buttons", SbAdmin2Controller, :buttons
    get "/sb_admin2/cards", SbAdmin2Controller, :cards
    get "/sb_admin2/colors", SbAdmin2Controller, :colors
    get "/sb_admin2/borders", SbAdmin2Controller, :borders
    get "/sb_admin2/animations", SbAdmin2Controller, :animations
    get "/sb_admin2/other", SbAdmin2Controller, :other
    get "/sb_admin2/tables", SbAdmin2Controller, :tables
    get "/sb_admin2/blank", SbAdmin2Controller, :blank
    get "/sb_admin2/404", SbAdmin2Controller, :page_404
  end

  scope "/", DemoWeb do
    pipe_through :browser

    get "/blank", PublicController, :blank
    get "/login", PublicController, :login
    get "/forgot-password", PublicController, :forgot_password
    get "/register", PublicController, :register
  end

  # Other scopes may use custom stacks.
  # scope "/api", DemoWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: DemoWeb.Telemetry
    end
  end
end
