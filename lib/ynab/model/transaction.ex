defmodule YNAB.Transaction do
  @derive [Poison.Encoder]

  defstruct [
    :id,
    :date,
    :amount,
    :memo,
    :cleared,
    :approved,
    :flag_color,
    :account_id,
    :payee_id,
    :category_id,
    :transfer_account_id,
    :transfer_transaction_id,
    :matched_transaction_id,
    :parent_transaction_id,
    :import_id,
    :deleted,
    :account_name,
    :payee_name,
    :category_name,
    :subtransactions,
    :transaction_id,
    :type
  ]

  @type t :: %__MODULE__{
          id: String.t(),
          date: %DateTime{},
          amount: integer(),
          memo: String.t(),
          cleared: String.t(),
          approved: boolean(),
          flag_color: String.t(),
          account_id: String.t(),
          payee_id: String.t(),
          category_id: String.t(),
          transfer_account_id: String.t(),
          transfer_transaction_id: String.t(),
          matched_transaction_id: String.t(),
          parent_transaction_id: String.t(),
          import_id: String.t(),
          deleted: boolean(),
          account_name: String.t(),
          payee_name: String.t(),
          category_name: String.t(),
          subtransactions: list(%YNAB.Subtransaction{}),
          transaction_id: String.t(),
          type: String.t()
        }
end
