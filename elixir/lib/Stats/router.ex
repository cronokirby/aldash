defmodule Aldash.Stats.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    conn
    |> put_resp_header("content-type", "text/plain")
    |> send_resp(200, "hello from the stats!")
  end
  match _ do
    conn
    |> send_resp(404, "Woops")
    |> halt
  end
end
