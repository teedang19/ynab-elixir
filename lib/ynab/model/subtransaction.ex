defmodule YNAB.Subtransaction do
  @derive [Poison.Encoder]

  defstruct [
    :id,
    :transaction_id,
    :amount,
    :memo,
    :payee_id,
    :payee_name,
    :category_id,
    :category_name,
    :transfer_account_id,
    :transfer_transaction_id,
    :deleted
  ]

  @type t :: %__MODULE__{
          id: String.t(),
          transaction_id: String.t(),
          amount: integer(),
          memo: String.t(),
          payee_id: String.t(),
          payee_name: String.t(),
          category_id: String.t(),
          category_name: String.t(),
          transfer_account_id: String.t(),
          transfer_transaction_id: String.t(),
          deleted: boolean()
        }
end
