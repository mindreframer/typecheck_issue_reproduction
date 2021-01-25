defmodule TypesExample.MixProject do
  use Mix.Project

  def project do
    [
      app: :types_example,
      version: "0.1.0",
      elixir: "~> 1.11",
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
      # {:type_check, "~> 0.3"}
      {:type_check, github: "Qqwy/elixir-type_check", ref: "7b98567cce4cd3817cecd30de607f0e12e95964c"},
      {:stream_data, "~> 0.5"},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
    ]
  end
end
