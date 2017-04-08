defmodule Aldash.Mixfile do
  use Mix.Project

  def project do
    [app: :aldash,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
  [applications: [:cowboy, :logger, :plug],
   mod: {Aldash, []}]
end

  defp deps do
  [{:cowboy, "~> 1.0.0"},
   {:plug, "~> 1.0"}]
end
end
