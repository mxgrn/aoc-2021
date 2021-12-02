defmodule Day02 do
  def part_1(input) do
    run(input, State)
  end

  def part_2(input) do
    run(input, AimedState)
  end

  defp run(input, mod) do
    %{position: position, depth: depth} =
      input
      |> parse()
      |> Enum.reduce(mod.new(), &mod.advance(&2, [&1]))

    position * depth
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
