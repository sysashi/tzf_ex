defmodule TzfEx do
  version = Mix.Project.config()[:version]

  use RustlerPrecompiled,
    otp_app: :tzf_ex,
    crate: "tzf_ex",
    base_url: "https://github.com/sysashi/tzf_ex/releases/download/#{version}",
    force_build: System.get_env("RUSTLER_BUILD") in ["1", "true"],
    nif_versions: ["2.17"],
    targets: ["x86_64-unknown-linux-gnu"],
    version: version

  def get_timezone_for_location(_lat, _lng), do: :erlang.nif_error(:nif_not_loaded)
end
