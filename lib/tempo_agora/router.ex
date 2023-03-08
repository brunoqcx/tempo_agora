defmodule TempoAgora.Router do
  use Plug.Router
  use Plug.Debugger, otp_app: :tempo_agora

  plug Plug.Logger
  plug Plug.Parsers, parsers: [:json, :urlencoded], json_decoder: {Jason, :decode!, [[keys: :atoms]]}
  plug :match
  plug :dispatch

  post "/" do
    spawn fn ->
      TempoAgora.Responder.send_msg
    end

    send_resp(conn, 200, ~s({"text":"ok"}))
  end

  match _ do
    send_resp(conn, 404, "not_found")
  end
end
