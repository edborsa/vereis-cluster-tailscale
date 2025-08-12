defmodule Vereis.MixProject do
  use Mix.Project

  def project do
    [
      app: :vereis,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Vereis.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:libcluster, "~> 3.4"},
      {:libcluster_tailscale, "~> 0.1.1"}
    ]
  end
end
