
defmodule BinaService.EventCube.Account do
    @moduledoc """
  The Account Action Atom. A live running process that handles commands for a domain.
  Can be called by

  BinaService.ScheduleManager.create_schedule(Account.open, BinaService.Period)

  %BinaService.Schedule{%command{}, %period{}, reply: %{}:}// a %{} map so that it can fit any struct/map returned by the function..including references.
  RISK:NOT type SAFE. Not good for calculations. best used for simply routing data/messages

  Business logic for operating a Finance.Account domain [
    start_link(account_owner) > pid
    open > %account{} *publishes account_opened event to dispatcher
    close > :ok or {:error, reason}
    deposit > :ok or {:error, reason}*publishes account_deposited event to dispatcher
    get_balance > float e.g 50.0

    Therefore a reference to EventCube.Domain is when you want to
    establish a communication contract: To start run a task at a scheduled time.
    When all batched tasked %TaskList{} in an execution context(e.g account opening commands in the future mixed with placing orders)
    super TaskList is a map of TaskLists e.g %{%TaskList{}, %TaskList{}...} this can form the base of Smart Contract on Bina. But such implimentation will need
  A GenServer for handling state and notification for a domain.
  The following example is a GenServer that handles the basic functions of Account domain that needs notification within the Bina domain
updates ledger (BinaService.Finance.Ledger)
  """

  use GenServer

  @spec init(any) :: {:ok, %{balance: 0, owner: any}}
  def init(owner) do
      {:ok, %{balance: 0, owner: owner}}
  end

  def start_link(account_owner_uuid) do
    case BinaService.Identities.get_user!(account_owner_uuid) do

      %BinaService.Identities.User{} = account_owner ->

        GenServer.start_link(__MODULE__, account_owner, name: :"#{account_owner.username}")

        _ ->
          {:error, "failed fetching user"}


    end

  end

end
