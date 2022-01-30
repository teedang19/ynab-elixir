defmodule YNAB.CategoryGroup do
  @derive [Poison.Encoder]

  defstruct [
    :id,
    :name,
    :hidden,
    :deleted,
    :categories
  ]

  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t(),
          hidden: boolean(),
          deleted: boolean(),
          categories: list(%YNAB.Category{})
        }
end
