defmodule YNAB.Util.AtomizeKeys do
  def atomize_keys(nil), do: nil

  def atomize_keys(struct = %{__struct__: _}) do
    struct
  end

  def atomize_keys(map = %{}) do
    for {key, val} <- map, into: %{} do
      cond do
        is_atom(key) ->
          {key, atomize_keys(val)}

        is_binary(key) ->
          {String.to_atom(key), atomize_keys(val)}

        true ->
          {atomize_keys(key), atomize_keys(val)}
      end
    end
  end

  def atomize_keys([head | rest]) do
    [atomize_keys(head) | atomize_keys(rest)]
  end

  def atomize_keys(not_a_map) do
    not_a_map
  end
end
