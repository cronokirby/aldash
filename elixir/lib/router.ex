defmodule Aldash.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    conn
    |> put_resp_header("content-type", "text/html")
    |> send_file(200, "../elm/index.html")
  end
  match _ do
    conn
    |> send_resp(404, "Woops")
    |> halt
  end
end
