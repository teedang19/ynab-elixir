defmodule YNAB.CurrencyFormat do
  @derive [Poison.Encoder]

  defstruct [
    :currency_symbol,
    :decimal_digits,
    :decimal_separator,
    :display_symbol,
    :example_format,
    :group_separator,
    :iso_code,
    :symbol_first
  ]

  @type t :: %__MODULE__{
          currency_symbol: String.t(),
          decimal_digits: non_neg_integer(),
          decimal_separator: String.t(),
          display_symbol: String.t(),
          example_format: String.t(),
          group_separator: String.t(),
          iso_code: String.t(),
          symbol_first: boolean()
        }
end
