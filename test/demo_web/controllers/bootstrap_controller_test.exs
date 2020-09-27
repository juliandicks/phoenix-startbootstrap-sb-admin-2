defmodule DemoWeb.BootstrapControllerTest do
  use DemoWeb.ConnCase

  alias Demo.DemoWeb

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:bootstrap) do
    {:ok, bootstrap} = DemoWeb.create_bootstrap(@create_attrs)
    bootstrap
  end

  describe "index" do
    test "lists all cats", %{conn: conn} do
      conn = get(conn, Routes.bootstrap_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Cats"
    end
  end

  describe "new bootstrap" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.bootstrap_path(conn, :new))
      assert html_response(conn, 200) =~ "New Bootstrap"
    end
  end

  describe "create bootstrap" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.bootstrap_path(conn, :create), bootstrap: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.bootstrap_path(conn, :show, id)

      conn = get(conn, Routes.bootstrap_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Bootstrap"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.bootstrap_path(conn, :create), bootstrap: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Bootstrap"
    end
  end

  describe "edit bootstrap" do
    setup [:create_bootstrap]

    test "renders form for editing chosen bootstrap", %{conn: conn, bootstrap: bootstrap} do
      conn = get(conn, Routes.bootstrap_path(conn, :edit, bootstrap))
      assert html_response(conn, 200) =~ "Edit Bootstrap"
    end
  end

  describe "update bootstrap" do
    setup [:create_bootstrap]

    test "redirects when data is valid", %{conn: conn, bootstrap: bootstrap} do
      conn = put(conn, Routes.bootstrap_path(conn, :update, bootstrap), bootstrap: @update_attrs)
      assert redirected_to(conn) == Routes.bootstrap_path(conn, :show, bootstrap)

      conn = get(conn, Routes.bootstrap_path(conn, :show, bootstrap))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, bootstrap: bootstrap} do
      conn = put(conn, Routes.bootstrap_path(conn, :update, bootstrap), bootstrap: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Bootstrap"
    end
  end

  describe "delete bootstrap" do
    setup [:create_bootstrap]

    test "deletes chosen bootstrap", %{conn: conn, bootstrap: bootstrap} do
      conn = delete(conn, Routes.bootstrap_path(conn, :delete, bootstrap))
      assert redirected_to(conn) == Routes.bootstrap_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.bootstrap_path(conn, :show, bootstrap))
      end
    end
  end

  defp create_bootstrap(_) do
    bootstrap = fixture(:bootstrap)
    %{bootstrap: bootstrap}
  end
end
