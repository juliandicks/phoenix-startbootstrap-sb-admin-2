defmodule DemoWeb.BootstrapController do
  use DemoWeb, :controller

  alias Demo.DemoWeb
  alias Demo.DemoWeb.Bootstrap

  def index(conn, _params) do
    conn
    |> put_flash(:error, "No dependencies found matching BOB")
    |> render("index.html")
  end

  def reset(conn, _params) do
    conn
    |> put_flash(:info, "Bootstrap tries to standardize the look and feel across browsers")
    |> render("reset.html")
  end

  def effective(conn, _params) do
    render(conn, "ex_effective.html")
  end

  def sb_admin_2(conn, _params) do
    render(conn, "sb-admin-2.html")
  end
end
