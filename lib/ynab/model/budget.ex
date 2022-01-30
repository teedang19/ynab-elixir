defmodule YNAB.Budget do
  @derive [Poison.Encoder]

  defstruct [
    :accounts,
    :categories,
    :category_groups,
    :currency_format,
    :date_format,
    :first_month,
    :id,
    :last_modified_on,
    :last_month,
    :months,
    :name,
    :payee_locations,
    :payees,
    :scheduled_subtransactions,
    :scheduled_transactions,
    :subtransactions,
    :transactions
  ]

  @type t :: %__MODULE__{
          accounts: list(%YNAB.Account{}),
          categories: list(%YNAB.Category{}),
          category_groups: list(%YNAB.CategoryGroup{}),
          currency_format: %YNAB.CurrencyFormat{},
          date_format: %YNAB.Format{},
          first_month: String.t(),
          id: String.t(),
          last_modified_on: %DateTime{},
          last_month: String.t(),
          name: String.t(),
          payee_locations: list(%YNAB.PayeeLocation{}),
          payees: list(%YNAB.Payee{}),
          scheduled_subtransactions: list(%YNAB.ScheduledSubtransaction{}),
          scheduled_transactions: list(%YNAB.ScheduledTransaction{}),
          subtransactions: list(%YNAB.Subtransaction{}),
          transactions: list(%YNAB.Transaction{})
        }
end
