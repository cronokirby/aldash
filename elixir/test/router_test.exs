defmodule Aldash.RouterTest do
  use ExUnit.Case
  use Plug.Test
  alias Aldash.Router

  @opts Router.init([])

  test "serves html at root" do
    conn = conn(:get, "/", "")
           |> Router.call(@opts)
    assert conn.state == :sent
    assert conn.status == 200
  end

  test "errors for unkown paths" do
    conn = conn(:get, "/random", "")
           |> Router.call(@opts)
    assert conn.state == :sent
    assert conn.status == 404
  end

  test "redirection works" do
    conn = conn(:get, "/stats", "")
           |> Router.call(@opts)
    assert conn.state == :sent
    assert conn.status == 200
  end
end
