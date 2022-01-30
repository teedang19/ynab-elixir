defmodule YNAB.Category do
  @derive [Poison.Encoder]

  defstruct [
    :id,
    :category_group_id,
    :name,
    :hidden,
    :original_category_group_id,
    :note,
    :budgeted,
    :activity,
    :balance,
    :goal_type,
    :goal_creation_month,
    :goal_target,
    :goal_target_month,
    :goal_percentage_complete,
    :goal_months_to_budget,
    :goal_under_funded,
    :goal_overall_funded,
    :goal_overall_left,
    :deleted
  ]

  @type t :: %__MODULE__{
          id: String.t(),
          category_group_id: String.t(),
          name: String.t(),
          hidden: boolean(),
          original_category_group_id: String.t(),
          note: String.t(),
          budgeted: integer(),
          activity: integer(),
          balance: integer(),
          goal_type: String.t(),
          goal_creation_month: String.t(),
          goal_target: integer(),
          goal_target_month: String.t(),
          goal_percentage_complete: integer(),
          goal_months_to_budget: integer(),
          goal_under_funded: integer(),
          goal_overall_funded: integer(),
          goal_overall_left: integer(),
          deleted: boolean()
        }
end
