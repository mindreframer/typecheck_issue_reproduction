## this fails on `mix dialyzer`
defmodule Input1 do
  use TypeCheck
  defstruct [:to, :from]

  @type! t :: %Input1{from: binary()}
  @spec! run(t()) :: boolean()
  def run(input) do
    IO.inspect(input.from)
    true
  end
end


## this works fine...
defmodule Input2 do
  defstruct [:to, :from]

  @type t :: %Input2{from: binary()}
  @spec run(t()) :: boolean()
  def run(input) do
    IO.inspect(input.from)
    true
  end
end
