defmodule Helloplug.MixProject do
  use Mix.Project

  def project do
    [
      app: :helloplug,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :ecto_sqlite3, :ecto, :cowboy, :plug]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, "~> 2.9"},
      {:plug_cowboy, "~> 2.0"},
      {:ecto_sqlite3, "~> 0.8.2"},
      {:ecto, "~> 3.9"}
    ]
  end
end
