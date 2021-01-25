# Showcase for unclear TypeCheck warnings



```elixir
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
```


Error message

```
Total errors: 2, Skipped: 0, Unnecessary Skips: 0
done in 0m1.2s
lib/types_example.ex:1:pattern_match
The pattern can never match the type.

Pattern:
{:error, _}

Type:
{:ok, []}

________________________________________________________________________________
lib/types_example.ex:1:call_without_opaque
Function call without opaqueness type mismatch.

Call does not have expected term of type
  {{TypeCheck.Builtin.Map.t()
    | %{
        :__struct__ => atom(),
        :choices => [any()],
        :element_type => _,
        :element_types => [any()],
        :keypairs => [any()],
        :name => atom(),
        :range => _,
        :type => _,
        :value => _
      }, atom(),
    %{
      :expected_length => non_neg_integer(),
      :expected_size => integer(),
      :index => integer(),
      :key => _,
      :keys => [any()],
      :problem => _,
      :problems => [any()]
    }, _}, nil | maybe_improper_list() | map()}
  | {TypeCheck.Builtin.Map.t()
     | %{
         :__struct__ => atom(),
         :choices => [any()],
         :element_type => _,
         :element_types => [any()],
         :keypairs => [any()],
         :name => atom(),
         :range => _,
         :type => _,
         :value => _
       }, atom(),
     %{
       :expected_length => non_neg_integer(),
       :expected_size => integer(),
       :index => integer(),
       :key => _,
       :keys => [any()],
       :problem => _,
       :problems => [any()]
     }, _}
 (with opaque subterms) in the 1st position.

TypeCheck.TypeError.exception(
  {{%TypeCheck.Spec{
      :name => :run,
      :param_types => [%TypeCheck.Builtin.FixedMap{:keypairs => [any(), ...]}, ...],
      :return_type => %TypeCheck.Builtin.Boolean{}
    }, :param_error,
    %{
      :index => 0,
      :problem =>
        {%TypeCheck.Builtin.FixedMap{
           :keypairs => [
             {:__struct__, %TypeCheck.Builtin.Literal{:value => Input1}}
             | {:from, %TypeCheck.Builtin.Binary{}},
             ...
           ]
         }, :missing_keys | :not_a_map | :value_error,
         %{
           :key => :__struct__ | :from,
           :keys => [:__struct__ | :from, ...],
           :problem =>
             {%{
                :__struct__ => TypeCheck.Builtin.Binary | TypeCheck.Builtin.Literal,
                :value => Input1
              }, :no_match | :not_same_value, %{}, _}
         }, _}
    }, [any(), ...]}, [{:file, <<_::512>>} | {:line, 1}, ...]}
)

```