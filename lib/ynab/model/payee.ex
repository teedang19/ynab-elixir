defmodule YNAB.Payee do
  @derive [Poison.Encoder]

  defstruct [
    :deleted,
    :id,
    :name,
    :transfer_account_id
  ]

  @type t :: %__MODULE__{
          deleted: boolean(),
          id: String.t(),
          name: String.t(),
          transfer_account_id: String.t()
        }
end
