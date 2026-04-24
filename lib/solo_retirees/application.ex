defmodule SoloRetirees.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      SoloRetireesWeb.Telemetry,
      SoloRetirees.Repo,
      {DNSCluster, query: Application.get_env(:solo_retirees, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: SoloRetirees.PubSub},
      # Start the Finch HTTP client for sending emails
      # {Finch, name: SoloRetirees.Finch},
      # Start a worker by calling: SoloRetirees.Worker.start_link(arg)
      # {SoloRetirees.Worker, arg},
      # Start to serve requests, typically the last entry
      SoloRetireesWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SoloRetirees.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SoloRetireesWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
