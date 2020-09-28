defmodule DemoWeb.PublicController do
  use DemoWeb, :controller

  plug :put_root_layout, {DemoWeb.LayoutView, :blank}

  def blank(conn, _params) do
    render(conn, "blank.html")
  end

  def register(conn, _params) do
    render(conn, "register.html")
  end

  def login(conn, _params) do
    render(conn, "login.html")
  end

  def forgot_password(conn, _params) do
    render(conn, "forgot_password.html")
  end
end
