defmodule ElixirPhoenixRestApi do
  alias ElixirPhoenixRestApi.User

  defdelegate create_user(params), to: User.Create, as: :call
end
