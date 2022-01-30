defmodule YNAB.BudgetSettings do
  @derive [Poison.Encoder]

  defstruct [
    :date_format,
    :currency_format
  ]

  @type t :: %__MODULE__{
          date_format: %YNAB.Format{},
          currency_format: %YNAB.CurrencyFormat{}
        }
end
