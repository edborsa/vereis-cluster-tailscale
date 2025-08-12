import Config

config :libcluster,
  topologies: [
    tailscale: [
      strategy: Cluster.Strategy.Tailscale,
      config: [
        authkey: System.get_env("TAILSCALE_AUTHKEY"),
        tailnet: System.get_env("TAILNET"),
        hostname: System.get_env("HOST"),
        appname: "vereis"
      ]
    ]
  ]
