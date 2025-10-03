defmodule TzfEx.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :tzf_ex,
      version: @version,
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      files: [
        "lib",
        "native/fzf_ex/.cargo",
        "native/fzf_ex/src",
        "native/tzf_ex/Cargo*",
        "checksum-*.exs",
        "mix.exs"
      ]
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
      {:rustler, "~> 0.37.1", runtime: false},
      {:rustler_precompiled, "~> 0.8"}
    ]
  end
end
