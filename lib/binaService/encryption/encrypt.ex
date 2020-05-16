defmodule BinaService.Encryption.Encrypt do


  def generate_key, do: :crypto.strong_rand_bytes(16) |> :base64.encode

  # def send(value, recipient, %Wallet{} = wallet) do
  #   with {:ok, unspent_outputs} <- unspent_outputs_for_value(value, wallet),
  #        inputs <- prepare_inputs(unspent_outputs),
  #        outputs <- [[recipient, value]],
  #        outputs <- add_change_output(value, outputs, unspent_outputs, wallet) do
  #     wallet
  #     |> Transaction.new_transaction(inputs, outputs)
  #     |> Ledger.write()
  #   end
  # end


  def tr(v,r,_w) do
    with {:ok, true} <-isnu?(v),
    {:ok, false} <- isnu?(r) do
      {:ok, "all condition matched"}
    end
  end

  def isnu?(v), do: {:ok, is_number v}
  def isnu?(_), do: {:error}

end

