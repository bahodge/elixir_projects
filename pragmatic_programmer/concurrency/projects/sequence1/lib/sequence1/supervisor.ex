defmodule Sequence1.Supervisor do
  use Supervisor

  def start_link(initial_number) do
    result = {:ok, sup} = Supervisor.start_link(__MODULE__, [initial_number])
    start_workers(sup, initial_number)
    result
  end

  def start_workers(sup, initial_number) do
    # start the stash worker
    {:ok, stash} = Supervisor.start_child(sup, worker(Sequence1.Stash, [initial_number]))
    Supervisor.start_child(sup, supervisor(Sequence1.SubSupervisor, [stash]))
  end

  def init(_) do
    supervise([], strategy: :one_for_one)
  end
end
