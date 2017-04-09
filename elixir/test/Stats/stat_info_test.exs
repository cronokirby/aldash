defmodule Aldash.Stats.StatInfoTest do
  use ExUnit.Case
  alias Aldash.Stats.StatInfo


  test "The current uptime should be given" do
    uptime = StatInfo.uptime()
    assert %{"d" => 0, "h" => 0, "m" => _} = uptime
  end
  test "Status about the current system should be returned" do
    info = StatInfo.full_stats()
    assert is_integer(info["processes"])
    assert is_integer(info["uptime"]["m"])
  end
end
