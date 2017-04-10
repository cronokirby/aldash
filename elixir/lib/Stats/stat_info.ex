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
      [:total, :code, :processes, :atom, :ets]
      |> Enum.map(fn
        atom when atom in [:atom, :ets] ->
          div(memory[atom], 1000)  # formatted in kb
        atom ->
          div(memory[atom], 1_000_000)  # formatted in mb
      end)
    {{_, io_input}, {_, io_output}}  = :erlang.statistics(:io)
    info = [processes, uptime()] ++ memories
    keys = ["processes", "uptime", "totalmem",
            "procmem", "codemem", "atmem", "ETSmem"]
    # We use string keys since we'll be converting this to json shortly
    Stream.zip(keys, info)
    |> Enum.into(%{})
    |> Map.merge(%{"io" => %{"input" => div(io_input, 1_000_000),
                             "output" => div(io_input, 1_000_000)}})
  end
end
