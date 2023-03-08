defmodule TempoAgora.MixProject do
  use Mix.Project

  def project do
    [
      app: :tempo_agora,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {TempoAgora, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, "~> 1.0.0"},
      {:plug, "~> 1.0"},
      {:jason, "~> 1.2"},
      {:plug_cowboy, "~> 1.0"},
      {:httpoison, "~> 1.6"}
    ]
  end
end
