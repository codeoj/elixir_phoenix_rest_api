defmodule ElixirPhoenixRestApi.Pokemon do
  @keys [:id, :name, :types, :moves]
  @enforce_keys @keys
  @derive Jason.Encoder

  defstruct @keys

  def build(%{"id" => id, "name" => name, "types" => types, "moves" => moves}) do
    %__MODULE__{
      id: id,
      name: name,
      types: parse_types(types),
      moves: parse_moves(moves)
    }
  end

  defp parse_types(types), do: Enum.map(types, fn item -> item["type"]["name"] end)
  defp parse_moves(moves), do: Enum.map(moves, fn item -> item["move"]["name"] end)
end
