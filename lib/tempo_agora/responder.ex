defmodule TempoAgora.Responder do
  def post_to_slack(encoded_msg) do
    System.get_env("TEMPO_AGORA_SLACK_OUT_WEBHOOK")
    |> HTTPoison.post(encoded_msg)
  end

  def send_msg do
    create_msg()
    |> Jason.encode!
    |> post_to_slack
  end

  def create_msg do
    {erl_date, erl_time} = :calendar.local_time()

    {:ok, raw_time} = Time.from_erl(erl_time)

    {:ok, raw_date} = Date.from_erl(erl_date)

    time = Calendar.strftime(raw_time, "%c", preferred_datetime: "%H:%M:%S")

    date = Calendar.strftime(raw_date, "%c", preferred_datetime: "%m-%d-%Y")

    %{
      "username" => "hello-bot",
      "icon_emoji" => ":cloud:",
      "text" => "Olá, agora são #{time} do dia #{date}"
      }
  end
end
