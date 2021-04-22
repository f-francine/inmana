defmodule Inmana.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Inmana.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Inmana.PubSub}
      # Start a worker by calling: Inmana.Worker.start_link(arg)
      # {Inmana.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Inmana.Supervisor)
  end
end
