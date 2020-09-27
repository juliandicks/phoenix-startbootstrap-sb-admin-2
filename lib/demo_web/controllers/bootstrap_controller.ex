defmodule DemoWeb.BootstrapController do
  use DemoWeb, :controller

  alias Demo.DemoWeb
  alias Demo.DemoWeb.Bootstrap

  def index(conn, _params) do
    conn
    |> put_flash(:error, "No dependencies found matching BOB")
    |> render("index.html")
  end

end
