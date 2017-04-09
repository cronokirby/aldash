defmodule Aldash.Stats.StatInfo do

  def full_stats do
    processes = length :erlang.processes()
    # We use string keys since we'll be converting this to json shortly
    %{"processes" => processes}
  end
end
