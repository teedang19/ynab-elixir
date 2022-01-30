defmodule YNAB do
  @moduledoc """
    An elixir library to interact with the YNAB API.
  """

  def client() do
    Application.get_env(:ynab, :client)
  end
end
