defmodule DemoWeb.SbAdmin2Controller do
  use DemoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def buttons(conn, _params) do
    render(conn, "buttons.html")
  end

  def cards(conn, _params) do
    render(conn, "cards.html")
  end

  def colors(conn, _params) do
    render(conn, "colors.html")
  end

  def borders(conn, _params) do
    render(conn, "borders.html")
  end

  def animations(conn, _params) do
    render(conn, "animations.html")
  end

  def other(conn, _params) do
    render(conn, "other.html")
  end

  def tables(conn, _params) do
    render(conn, "tables.html")
  end

  def page_404(conn, _params) do
    render(conn, "page_404.html")
  end

  def blank(conn, _params) do
    render(conn, "blank.html")
  end
end
