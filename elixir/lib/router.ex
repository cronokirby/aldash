defmodule Aldash.Router do
  use Plug.Router
  alias Aldash.Stats

  plug Plug.Static, at: "/", from: "../build"
  plug :match
  plug :dispatch

  forward "/stats", to: Stats.Router

  get "/" do
    send_file(conn, 200, "../build/index.html")
  end
  match _ do
    conn
    |> send_resp(404, "Woops")
    |> halt
  end
end
