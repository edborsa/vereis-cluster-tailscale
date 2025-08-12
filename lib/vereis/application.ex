defmodule Vereis.Application do
  use Application

  @impl true
  def start(_type, _args) do
    topologies = Application.get_env(:libcluster, :topologies) || []

    children = [
      {Cluster.Supervisor, [topologies, [name: Vereis.ClusterSupervisor]]}
    ]

    opts = [strategy: :one_for_one, name: Vereis.Supervisor]
    Supervisor.start_link(children, opts)
  end
end