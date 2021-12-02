defmodule Day02 do
  @moduledoc """
  Documentation for `Day02`.
  """

  def part_1(input) do
    {pos, dep} =
      input
      |> parse()
      |> Enum.reduce({0, 0}, fn
        {:forward, value}, {pos, dep} -> {pos + value, dep}
        {:down, value}, {pos, dep} -> {pos, dep + value}
        {:up, value}, {pos, dep} -> {pos, dep - value}
      end)

    pos * dep
  end

  def part_2(input) do
    {pos, dep, _} =
      input
      |> parse()
      |> Enum.reduce({0, 0, 0}, fn
        {:forward, value}, {pos, dep, aim} -> {pos + value, dep + value * aim, aim}
        {:down, value}, {pos, dep, aim} -> {pos, dep, aim + value}
        {:up, value}, {pos, dep, aim} -> {pos, dep, aim - value}
      end)

    pos * dep
  end

  # Parse input into Keyword list with keys being commands, values being command arguments
  defp parse(input) do
    input
    |> String.split("\n")
    |> Enum.slice(0..-2)
    |> Enum.map(&String.split(&1, " "))
    |> Enum.map(fn [command, value] ->
      {String.to_existing_atom(command), String.to_integer(value)}
    end)
  end
end
