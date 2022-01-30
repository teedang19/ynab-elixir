defmodule YNAB.Format do
  @derive [Poison.Encoder]

  defstruct [:format]

  @type t :: %__MODULE__{
          format: String.t()
        }
end
