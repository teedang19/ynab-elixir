defmodule YNAB.ScheduledSubtransaction do
  @derive [Poison.Encoder]

  defstruct [
    :id,
    :scheduled_transaction_id,
    :amount,
    :memo,
    :payee_id,
    :category_id,
    :transfer_account_id,
    :deleted
  ]

  @type t :: %__MODULE__{
          id: String.t(),
          scheduled_transaction_id: String.t(),
          amount: integer(),
          memo: String.t(),
          payee_id: String.t(),
          category_id: String.t(),
          transfer_account_id: String.t(),
          deleted: boolean()
        }
end
