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

  test "Full information should be given" do
    info = StatInfo.full_stats()
    Enum.each ["uptime", "processes", "totalmem",
               "codemem", "IOin", "IOout",
               "procmem", "ETSmem", "atmem"],
               fn k -> assert Map.has_key?(info, k) end
  end
end
