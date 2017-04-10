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
    memory = :erlang.memory()
    memories =
      [:total, :code, :process, :atom, :ets]
      |> Stream.zip([1000, 1000, 1000, 1_000_000, 1_000_000])
      Enum.map(fn {atom, size} ->
        memory[atom] / size
      end)
    {{_, io_input}, {_, io_output}}  = :erlang.statistics(:io)
    info = [processes, uptime(), io_input / 1000, io_output / 100] ++
           memories
    keys = ["processes", "uptime", "IOin", "IOout",
            "totalmem", "procmem", "codemem", "atmem", "ETSmem"]
    # We use string keys since we'll be converting this to json shortly
    Stream.zip(keys, info) |> Enum.into(%{})
  end
end
