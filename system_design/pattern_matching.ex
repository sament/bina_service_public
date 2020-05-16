 defmodule BinaService.PatternMatching do

  # iex(4)> %Fraction{a: a, b: b} = one_half
  # %Fraction{a: 1, b: 2}
  # iex(5)> a
  # 1
  # iex(6)> b
  # 2
  # This makes it possible to assert that some variable is really a struct:
  # iex(6)> %Fraction{} = one_half
  # %Fraction{a: 1, b: 2}
  # Successful match
  # iex(7)> %Fraction{} = %{a: 1, b: 2}
  # ** (MatchError) no match of right hand side value: %{a: 1, b: 2}
end
