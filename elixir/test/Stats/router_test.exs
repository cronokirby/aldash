defmodule Aldash.Stats.RouterTest do
  use ExUnit.Case
  use Plug.Test
  alias Aldash.Router

  @opts Router.init([])

  defp test_resp(info) do
    assert %{"uptime" => %{"d" => 0, "h" => 0, "m" => _},
             "processes" => _} = info
  end

  test "returns a valid response" do
    conn = conn(:get, "/stats", "")
           |> Router.call(@opts)
    assert conn.state == :sent
    assert conn.status == 200
    conn.resp_body |> Poison.decode! |> test_resp
  end

  test "always returns the refresh" do
    conn = conn(:post, "/stats", "")
           |> Router.call(@opts)
    assert conn.state == :sent
    assert conn.status == 200
    conn.resp_body |> Poison.decode! |> test_resp
  end
end
