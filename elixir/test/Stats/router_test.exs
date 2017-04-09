defmodule Aldash.Stats.RouterTest do
  use ExUnit.Case
  use Plug.Test
  alias Aldash.Router

  @opts Router.init([])

  test "returns a valid response" do
    conn = conn(:get, "/stats", "")
           |> Router.call(@opts)
    assert conn.state == :sent
    assert conn.status == 200
  end

  test "404s on unkown paths" do
    conn = conn(:get, "/stats/foo", "")
           |> Router.call(@opts)
    assert conn.state == :sent
    assert conn.status == 404
  end
end
