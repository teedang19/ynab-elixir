defmodule YNAB.ParseData do
  alias YNAB.{
    Account,
    Budget,
    BudgetSettings,
    Category,
    CategoryGroup,
    CurrencyFormat,
    Format,
    Month,
    Payee,
    PayeeLocation,
    ScheduledSubtransaction,
    ScheduledTransaction,
    Subtransaction,
    Transaction
  }

  def parse_budgets(budgets) do
    Enum.map(budgets, &parse_budget/1)
  end

  def parse_budget(budget) do
    budget =
      cond do
        Map.has_key?(budget, :accounts) ->
          %{budget | accounts: parse_accounts(budget.accounts)}

        true ->
          budget
      end

    budget =
      cond do
        Map.has_key?(budget, :categories) ->
          %{budget | categories: parse_categories(budget.categories)}

        true ->
          budget
      end

    budget =
      cond do
        Map.has_key?(budget, :category_groups) ->
          %{budget | category_groups: parse_category_groups(budget.category_groups)}

        true ->
          budget
      end

    budget =
      cond do
        Map.has_key?(budget, :currency_format) ->
          %{budget | currency_format: parse_currency_format(budget.currency_format)}

        true ->
          budget
      end

    budget =
      cond do
        Map.has_key?(budget, :date_format) ->
          %{budget | date_format: parse_format(budget.date_format)}

        true ->
          budget
      end

    budget =
      cond do
        Map.has_key?(budget, :months) ->
          %{budget | months: parse_months(budget.months)}

        true ->
          budget
      end

    budget =
      cond do
        Map.has_key?(budget, :payee_locations) ->
          %{budget | payee_locations: parse_payee_locations(budget.payee_locations)}

        true ->
          budget
      end

    budget =
      cond do
        Map.has_key?(budget, :payees) ->
          %{budget | payees: parse_payees(budget.payees)}

        true ->
          budget
      end

    budget =
      cond do
        Map.has_key?(budget, :scheduled_subtransactions) ->
          %{
            budget
            | scheduled_subtransactions:
                parse_scheduled_subtransactions(budget.scheduled_subtransactions)
          }

        true ->
          budget
      end

    budget =
      cond do
        Map.has_key?(budget, :scheduled_transactions) ->
          %{
            budget
            | scheduled_transactions: parse_scheduled_transactions(budget.scheduled_transactions)
          }

        true ->
          budget
      end

    budget =
      cond do
        Map.has_key?(budget, :subtransactions) ->
          %{budget | subtransactions: parse_subtransactions(budget.subtransactions)}

        true ->
          budget
      end

    budget =
      cond do
        Map.has_key?(budget, :transactions) ->
          %{budget | transactions: parse_transactions(budget.transactions)}

        true ->
          budget
      end

    struct(Budget, budget)
  end

  def parse_budget_settings(budget_settings) do
    budget_settings = %{
      budget_settings
      | currency_format: parse_currency_format(budget_settings.currency_format)
    }

    struct(BudgetSettings, budget_settings)
  end

  def parse_format(format) do
    struct(Format, format)
  end

  def parse_accounts(accounts) do
    Enum.map(accounts, &parse_account/1)
  end

  def parse_account(account) do
    struct(Account, account)
  end

  def parse_category_groups(category_groups) do
    Enum.map(category_groups, &parse_category_group/1)
  end

  def parse_category_group(category_group) do
    category_group =
      cond do
        Map.has_key?(category_group, :categories) ->
          %{category_group | categories: parse_categories(category_group.categories)}

        true ->
          category_group
      end

    struct(CategoryGroup, category_group)
  end

  def parse_categories(categories) do
    Enum.map(categories, &parse_category/1)
  end

  def parse_category(category) do
    struct(Category, category)
  end

  def parse_months(months) do
    Enum.map(months, &parse_month/1)
  end

  def parse_month(month) do
    month =
      cond do
        Map.has_key?(month, :categories) ->
          %{month | categories: parse_categories(month.categories)}

        true ->
          month
      end

    struct(Month, month)
  end

  def parse_payee_locations(payee_locations) do
    Enum.map(payee_locations, &parse_payee_location/1)
  end

  def parse_payee_location(payee_location) do
    struct(PayeeLocation, payee_location)
  end

  def parse_payees(payees) do
    Enum.map(payees, &parse_payee/1)
  end

  def parse_payee(payee) do
    struct(Payee, payee)
  end

  def parse_transactions(transactions) do
    Enum.map(transactions, &parse_transaction/1)
  end

  def parse_transaction(transaction) do
    cond do
      Map.has_key?(transaction, :subtransactions) ->
        transaction = %{
          transaction
          | subtransactions: parse_subtransactions(transaction.subtransactions)
        }

        struct(Transaction, transaction)

      true ->
        struct(Transaction, transaction)
    end
  end

  def parse_scheduled_transactions(scheduled_transactions) do
    Enum.map(scheduled_transactions, &parse_scheduled_transaction/1)
  end

  def parse_scheduled_transaction(scheduled_transaction) do
    cond do
      Map.has_key?(scheduled_transaction, :subtransactions) ->
        scheduled_transaction = %{
          scheduled_transaction
          | subtransactions:
              parse_scheduled_subtransactions(scheduled_transaction.subtransactions)
        }

        struct(ScheduledTransaction, scheduled_transaction)

      true ->
        struct(ScheduledTransaction, scheduled_transaction)
    end
  end

  def parse_scheduled_subtransactions(scheduled_subtransactions) do
    Enum.map(scheduled_subtransactions, &parse_scheduled_subtransaction/1)
  end

  def parse_scheduled_subtransaction(scheduled_subtransaction) do
    struct(ScheduledSubtransaction, scheduled_subtransaction)
  end

  def parse_subtransactions(subtransactions) do
    Enum.map(subtransactions, &parse_subtransaction/1)
  end

  def parse_subtransaction(subtransaction) do
    struct(Subtransaction, subtransaction)
  end

  def parse_currency_format(currency_format) do
    struct(CurrencyFormat, currency_format)
  end
end
