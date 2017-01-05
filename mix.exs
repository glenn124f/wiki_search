defmodule WikiSearch.Mixfile do
  use Mix.Project

  def project do
    [app: :wiki_search,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     escript: [main_module: WikiSearch.CLI], 
     deps: deps()]
  end

  def application do
    [applications: [:logger, :httpoison]]
  end

  defp deps do
    [
      {:httpoison, "~> 0.10.0"},
      {:poison, "~> 3.0"}
    ]
  end
end
