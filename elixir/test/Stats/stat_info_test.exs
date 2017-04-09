defmodule Aldash.Stats.StatInfoTest do
  use ExUnit.Case
  alias Aldash.Stats.StatInfo


  test "Status about the current system should be returned" do
    info = StatInfo.full_stats()
    assert is_integer(info["processes"])
  end
end
