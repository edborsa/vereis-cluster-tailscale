# Elixir Cluster Setup with Tailscale

## Prerequisites

1. **Tailscale Setup**: Both machines need Tailscale installed and connected to the same tailnet
2. **Environment Variables**:
   - `TAILNET`: Your tailnet name (e.g., `your-company.ts.net`)
   - `TAILSCALE_API_KEY`: API key from Tailscale admin console

## Running the Demo

### Local Machine
```bash
export TAILNET="your-tailnet.ts.net"
export TAILSCALE_API_KEY="your-api-key"
iex --name local@$(tailscale ip -4) -S mix
```

### Hetzner Machine
```bash
export TAILNET="your-tailnet.ts.net" 
export TAILSCALE_API_KEY="your-api-key"
iex --name hetzner@$(tailscale ip -4) -S mix
```

## Testing Connectivity

Once both nodes are running, test the cluster:

```elixir
# Check connected nodes
Vereis.ClusterDemo.show_nodes()

# Ping all nodes
Vereis.ClusterDemo.ping_all_nodes()

# Execute function on remote node
Vereis.ClusterDemo.execute_on_node(:"hetzner@100.x.x.x", IO, :puts, ["Hello from local!"])
```

## Notes

- Nodes automatically discover each other via Tailscale network
- The `tag: "elixir-cluster"` in config helps filter relevant machines
- Use `tailscale ip -4` to get the Tailscale IP for node naming