import Config

config :libcluster,
  topologies: [
    tailscale: [
      strategy: LibclusterTailscale.Strategy,
      config: [
        tailnet: System.get_env("TAILNET") || "your-tailnet.ts.net",
        api_key: System.get_env("TAILSCALE_API_KEY"),
        tag: "elixir-cluster"
      ]
    ]
  ]