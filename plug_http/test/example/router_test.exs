defmodule Example.SimpleRoutesTest do
  use ExUnit.Case
  use Plug.Test

  alias Example.SimpleRoutes

  @content "<html><body>Hi!</body></html>"
  @mimetype "text/html"

  @opts SimpleRoutes.init([])

  test "returns welcome" do
    conn =
      :get
      |> conn("/", "")
      |> SimpleRoutes.call(@opts)

    assert conn.state == :sent
    assert conn.status == 200
  end

  test "returns uploaded" do
    conn =
      :get
      |> conn("/upload?content=#{@content}&mimetype=#{@mimetype}")
      |> SimpleRoutes.call(@opts)

    assert conn.state == :sent
    assert conn.status == 201
  end

  test "returns 404" do
    conn =
      :get
      |> conn("/missing", "")
      |> SimpleRoutes.call(@opts)

    assert conn.state == :sent
    assert conn.status == 404
  end
end
