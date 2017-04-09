defmodule Aldash.Stats.StatInfo do

  def uptime do
    {time, _} = :erlang.statistics(:wall_clock)
    min = div(time, 1000 * 60)
    {hours, min} = {div(min, 60), rem(min, 60)}
    {days, hours} = {div(hours, 60), rem(hours, 60)}
    %{"d" => days, "h" => hours, "m" => min}
  end
  def full_stats do
    processes = length :erlang.processes()
    # We use string keys since we'll be converting this to json shortly
    %{"processes" => processes, "uptime" => uptime()}
  end
end
