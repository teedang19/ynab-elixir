defmodule YNAB.Account do
  @derive [Poison.Encoder]

  defstruct [
    :id,
    :name,
    :type,
    :on_budget,
    :closed,
    :note,
    :balance,
    :cleared_balance,
    :uncleared_balance,
    :transfer_payee_id,
    :direct_import_linked,
    :direct_import_in_error,
    :deleted
  ]

  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t(),
          type: String.t(),
          on_budget: boolean(),
          closed: boolean(),
          note: String.t(),
          balance: integer(),
          cleared_balance: integer(),
          uncleared_balance: integer(),
          transfer_payee_id: String.t(),
          direct_import_linked: boolean(),
          direct_import_in_error: boolean(),
          deleted: boolean()
        }
end
