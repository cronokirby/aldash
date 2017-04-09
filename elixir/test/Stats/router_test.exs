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
    assert match?(~s/{"processes":/ <> _, conn.resp_body)
  end

  test "always returns the refresh" do
    conn = conn(:post, "/stats", "")
           |> Router.call(@opts)
    assert conn.state == :sent
    assert conn.status == 200
    assert match?(~s/{"processes":/ <> _, conn.resp_body)
  end
end
