defmodule Towel.Mixfile do
  use Mix.Project

  def project do
    [
      app: :towel,
      description: "A delightfully simple monad library that's written for Elixir.",
      version: "0.4.1",
      elixir: "~> 1.0",
      package: package(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def package do
    [
      licenses: ["MIT"],
      contributors: ["Kash Nouroozi", "tim-smart"],
      links: %{"Github" => "https://github.com/r26D/towel"}
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.28", only: :dev},
      {:excoveralls, "~> 0.14", only: :test},
      {:credo, "~> 1.6", only: [:dev, :test]},
      {:dialyxir, "~> 1.1.0", only: [:dev, :test], runtime: false}
    ]
  end
end
