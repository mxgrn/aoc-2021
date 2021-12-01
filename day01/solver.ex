defmodule Solver do
  def part1() do
    Input.input()
    |> Enum.reduce({0, :infinity}, fn n, {count, prev} ->
      inc = if n > prev, do: 1, else: 0
      {count + inc, n}
    end)
    |> elem(0)
  end

  def part2() do
    infinity = 1_000_000
    window = [infinity, infinity, infinity]

    Input.input()
    |> Enum.reduce({0, window}, fn n, {count, [_, prev_2, prev_3] = prev_window} ->
      window = [prev_2, prev_3, n]
      inc = if Enum.sum(prev_window) < Enum.sum(window), do: 1, else: 0
      {count + inc, window}
    end)
    |> elem(0)
  end
end
