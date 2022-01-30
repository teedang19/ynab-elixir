defmodule YNAB.ScheduledTransaction do
  @derive [Poison.Encoder]

  defstruct [
    :id,
    :date_first,
    :date_next,
    :frequency,
    :amount,
    :memo,
    :flag_color,
    :account_id,
    :payee_id,
    :category_id,
    :transfer_account_id,
    :deleted,
    :account_name,
    :payee_name,
    :category_name,
    :subtransactions
  ]

  @type t :: %__MODULE__{
          id: String.t(),
          date_first: %DateTime{},
          date_next: %DateTime{},
          frequency: String.t(),
          amount: integer(),
          memo: String.t(),
          flag_color: String.t(),
          account_id: String.t(),
          payee_id: String.t(),
          category_id: String.t(),
          transfer_account_id: String.t(),
          deleted: boolean(),
          account_name: String.t(),
          payee_name: String.t(),
          category_name: String.t(),
          subtransactions: list(%YNAB.ScheduledSubtransaction{})
        }
end
