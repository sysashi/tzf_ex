defmodule TzfEx.MixProject do
  use Mix.Project

  @version "0.1.0"

  @description """
  A very dumb Rustler wrapper around tzf-rs library
  """

  @repo "https://github.com/sysashi/tzf_ex"

  def project do
    [
      app: :tzf_ex,
      version: @version,
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      description: @description,
      deps: deps(),
      package: package()
    ]
  end

  def package do
    [
      links: %{"GitHub" => @repo},
      licenses: ["MIT"],
      files: [
        "lib",
        # "native/tzf_ex/.cargo",
        "native/tzf_ex/src",
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
      {:rustler_precompiled, "~> 0.8"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end
