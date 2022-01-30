defmodule YNAB.Client do
  use HTTPoison.Base

  alias YNAB.ParseResponse

  @ynab_api_version "v1"
  @base_url "https://api.youneedabudget.com"

  def get_budgets([include_accounts: include_accounts] \\ [include_accounts: false]) do
    get("/budgets", [], params: [include_accounts: include_accounts])
    |> handle_response()
  end

  def get_budget(
        budget_id,
        [last_knowledge_of_server: last_knowledge_of_server] \\ [last_knowledge_of_server: 0]
      ) do
    get("/budgets/#{budget_id}", [], params: [last_knowledge_of_server: last_knowledge_of_server])
    |> handle_response()
  end

  def get_budget_settings(budget_id) do
    get("/budgets/#{budget_id}/settings")
    |> handle_response()
  end

  def get_accounts(
        budget_id,
        [last_knowledge_of_server: last_knowledge_of_server] \\ [last_knowledge_of_server: 0]
      ) do
    get("/budgets/#{budget_id}/accounts", [],
      params: [last_knowledge_of_server: last_knowledge_of_server]
    )
    |> handle_response()
  end

  def get_account(
        budget_id,
        account_id,
        [last_knowledge_of_server: last_knowledge_of_server] \\ [last_knowledge_of_server: 0]
      ) do
    get("/budgets/#{budget_id}/accounts/#{account_id}", [],
      last_knowledge_of_server: last_knowledge_of_server
    )
    |> handle_response()
  end

  def get_categories(
        budget_id,
        [last_knowledge_of_server: last_knowledge_of_server] \\ [last_knowledge_of_server: 0]
      ) do
    get("/budgets/#{budget_id}/categories", [],
      params: [last_knowledge_of_server: last_knowledge_of_server]
    )
    |> handle_response()
  end

  def get_category(budget_id, category_id) do
    get("/budgets/#{budget_id}/categories/#{category_id}")
    |> handle_response()
  end

  def get_category_for_month(budget_id, category_id, month) do
    get("/budgets/#{budget_id}/months/#{month}/categories/#{category_id}")
    |> handle_response()
  end

  def get_payees(
        budget_id,
        [last_knowledge_of_server: last_knowledge_of_server] \\ [last_knowledge_of_server: 0]
      ) do
    get("/budgets/#{budget_id}/payees", [],
      params: [last_knowledge_of_server: last_knowledge_of_server]
    )
    |> handle_response()
  end

  def get_payee(budget_id, payee_id) do
    get("/budgets/#{budget_id}/payees/#{payee_id}")
    |> handle_response()
  end

  def get_budget_payee_locations(budget_id) do
    get("/budgets/#{budget_id}/payee_locations")
    |> handle_response()
  end

  def get_payee_location(budget_id, payee_location_id) do
    get("/budgets/#{budget_id}/payee_locations/#{payee_location_id}")
    |> handle_response()
  end

  def get_payee_locations(budget_id, payee_id) do
    get("/budgets/#{budget_id}/payees/#{payee_id}/payee_locations")
    |> handle_response()
  end

  def get_budget_months(budget_id) do
    get("/budgets/#{budget_id}/months")
    |> handle_response()
  end

  def get_budget_month(budget_id, month) do
    get("/budgets/#{budget_id}/months/#{month}")
    |> handle_response()
  end

  def get_budget_transactions(budget_id, params \\ []) do
    get("/budgets/#{budget_id}/transactions", [], params: params)
    |> handle_response()
  end

  def create_transactions(budget_id, %{transactions: transaction_maps}) do
    post("/budgets/#{budget_id}/transactions", %{transactions: transaction_maps},
      "Content-Type": "application/json"
    )
    |> handle_response()
  end

  def create_transaction(budget_id, %{transaction: transaction_map}) do
    post("/budgets/#{budget_id}/transactions", %{transaction: transaction_map},
      "Content-Type": "application/json"
    )
    |> handle_response()
  end

  def get_transaction(budget_id, transaction_id) do
    get("/budgets/#{budget_id}/transactions/#{transaction_id}")
    |> handle_response()
  end

  def get_account_transactions(budget_id, account_id, params \\ []) do
    get("/budgets/#{budget_id}/accounts/#{account_id}/transactions", [], params: params)
    |> handle_response()
  end

  def get_category_transactions(budget_id, category_id, params \\ []) do
    get("/budgets/#{budget_id}/categories/#{category_id}/transactions", [], params: params)
    |> handle_response()
  end

  def get_payee_transactions(budget_id, payee_id, params \\ []) do
    get("/budgets/#{budget_id}/payees/#{payee_id}/transactions", [], params: params)
    |> handle_response()
  end

  def get_scheduled_transactions(
        budget_id,
        [last_knowledge_of_server: last_knowledge_of_server] \\ [last_knowledge_of_server: 0]
      ) do
    get("/budgets/#{budget_id}/scheduled_transactions", [],
      params: [last_knowledge_of_server: last_knowledge_of_server]
    )
    |> handle_response()
  end

  def get_scheduled_transaction(budget_id, scheduled_transaction_id) do
    get("/budgets/#{budget_id}/scheduled_transactions/#{scheduled_transaction_id}")
    |> handle_response()
  end

  @impl HTTPoison.Base
  def process_request_url(path) do
    URI.merge(
      @base_url,
      @ynab_api_version <> path
    )
    |> URI.to_string()
  end

  defp handle_response(raw_response = {:error, %HTTPoison.Error{}}), do: raw_response

  defp handle_response({:ok, error = %HTTPoison.Response{body: %{error: _error}}}) do
    {:error, error}
  end

  defp handle_response({:ok, raw_response = %HTTPoison.Response{body: %{data: _data}}}) do
    ParseResponse.parse(raw_response)
  end

  @impl HTTPoison.Base
  def process_request_headers(headers) do
    [{:Authorization, "Bearer #{api_access_token()}"} | headers]
  end

  @impl HTTPoison.Base
  def process_request_body(body) do
    Poison.encode!(body)
  end

  @impl HTTPoison.Base
  def process_response_body(body) do
    body
    |> Poison.decode!()
    |> YNAB.Util.AtomizeKeys.atomize_keys()
  end

  defp api_access_token do
    Application.get_env(:ynab, :api_access_token) || System.get_env("YNAB_API_ACCESS_TOKEN")
  end
end
