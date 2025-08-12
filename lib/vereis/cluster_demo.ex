defmodule Vereis.ClusterDemo do
  @doc """
  Shows connected nodes in the cluster
  """
  def show_nodes do
    nodes = Node.list()
    IO.puts("Connected nodes: #{inspect(nodes)}")
    IO.puts("Current node: #{Node.self()}")
    nodes
  end

  @doc """
  Sends a message to all nodes in the cluster
  """
  def ping_all_nodes do
    nodes = Node.list()
    
    if Enum.empty?(nodes) do
      IO.puts("No connected nodes found")
    else
      for node <- nodes do
        case Node.ping(node) do
          :pong -> IO.puts("✓ #{node} is alive")
          :pang -> IO.puts("✗ #{node} is not responding")
        end
      end
    end
  end

  @doc """
  Executes a function on a remote node
  """
  def execute_on_node(node, module, function, args \\ []) do
    case :rpc.call(node, module, function, args) do
      {:badrpc, reason} -> 
        IO.puts("RPC failed: #{inspect(reason)}")
        {:error, reason}
      result -> 
        IO.puts("Result from #{node}: #{inspect(result)}")
        {:ok, result}
    end
  end
end