defmodule YNAB.MixProject do
  use Mix.Project

  def project do
    [
      app: :ynab,
      description: "Elixir wrapper around the YNAB API",
      package: package(),
      version: "1.0.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:poison, "~> 5.0"}
    ]
  end

  defp package do
    [
      name: "ynab-elixir",
      licenses: ["MIT License"],
      links: %{"GitHub" => "https://github.com/teedang19/ynab-elixir"},
      source_url: "https://github.com/teedang19/ynab-elixir"
    ]
  end
end
