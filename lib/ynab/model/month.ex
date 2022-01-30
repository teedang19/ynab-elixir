defmodule YNAB.Month do
  @derive [Poison.Encoder]

  defstruct [
    :activity,
    :age_of_money,
    :budgeted,
    :categories,
    :deleted,
    :income,
    :month,
    :note,
    :to_be_budgeted
  ]

  @type t :: %__MODULE__{
          activity: integer(),
          age_of_money: integer(),
          budgeted: integer(),
          categories: list(%YNAB.Category{}),
          deleted: boolean(),
          income: integer(),
          month: String.t(),
          note: String.t(),
          to_be_budgeted: integer()
        }
end
