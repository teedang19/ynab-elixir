defmodule YNAB.ParseResponse do
  alias YNAB.ParseData

  def parse(raw_response = %HTTPoison.Response{body: %{data: data}}) do
    case data do
      %{accounts: account_maps} ->
        format_response(raw_response, ParseData.parse_accounts(account_maps))

      %{account: account_map} ->
        format_response(raw_response, ParseData.parse_account(account_map))

      %{budgets: budget_maps} ->
        format_response(raw_response, ParseData.parse_budgets(budget_maps))

      %{budget: budget_map} ->
        format_response(raw_response, ParseData.parse_budget(budget_map))

      %{category_groups: category_group_maps} ->
        format_response(raw_response, ParseData.parse_category_groups(category_group_maps))

      %{category: category_map} ->
        format_response(raw_response, ParseData.parse_category(category_map))

      %{months: month_maps} ->
        format_response(raw_response, ParseData.parse_months(month_maps))

      %{month: month_map} ->
        format_response(raw_response, ParseData.parse_month(month_map))

      %{payee: payee_map} ->
        format_response(raw_response, ParseData.parse_payee(payee_map))

      %{payee_locations: payee_location_maps} ->
        format_response(raw_response, ParseData.parse_payee_locations(payee_location_maps))

      %{payee_location: payee_location_map} ->
        format_response(raw_response, ParseData.parse_payee_location(payee_location_map))

      %{payees: payee_maps} ->
        format_response(raw_response, ParseData.parse_payees(payee_maps))

      %{scheduled_transactions: scheduled_transaction_maps} ->
        format_response(
          raw_response,
          ParseData.parse_scheduled_transactions(scheduled_transaction_maps)
        )

      %{scheduled_transaction: scheduled_transaction_map} ->
        format_response(
          raw_response,
          ParseData.parse_scheduled_transaction(scheduled_transaction_map)
        )

      %{settings: budget_settings_map} ->
        format_response(raw_response, ParseData.parse_budget_settings(budget_settings_map))

      %{transactions: transaction_maps} ->
        format_response(raw_response, ParseData.parse_transactions(transaction_maps))

      %{transaction: transaction_map} ->
        format_response(raw_response, ParseData.parse_transaction(transaction_map))
    end
  end

  defp format_response(raw_response, data) do
    {:ok, raw_response, data}
  end
end
