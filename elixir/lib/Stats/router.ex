defmodule Aldash.Stats.Router do
  use Plug.Router
  alias Aldash.Stats.StatInfo

  plug :match
  plug :dispatch

  # Regardless of what gets asked, we just send the whole info
  match _ do
    info = StatInfo.full_stats()
    conn
    |> put_resp_header("content-type", "application/json")
    |> send_resp(200, Poison.encode! info)
  end
end
