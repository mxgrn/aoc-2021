defmodule Day02Test do
  use ExUnit.Case
  doctest Day02

  @input """
  forward 5
  down 5
  forward 8
  up 3
  down 8
  forward 2
  """

  test "part 1 works" do
    assert Day02.part_1(@input) == 150
  end

  test "part 2 works" do
    assert Day02.part_2(@input) == 900
  end
end
