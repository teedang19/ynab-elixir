defmodule YNAB.PayeeLocation do
  @derive [Poison.Encoder]

  defstruct [
    :deleted,
    :id,
    :latitude,
    :longitude,
    :payee_id
  ]

  @type t :: %__MODULE__{
          deleted: boolean(),
          id: String.t(),
          latitude: String.t(),
          longitude: String.t(),
          payee_id: String.t()
        }
end
