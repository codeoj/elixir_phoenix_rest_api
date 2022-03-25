defmodule ElixirPhoenixRestApi do
  alias ElixirPhoenixRestApi.User

  defdelegate create_trainer(params), to: User.Create, as: :call
end
