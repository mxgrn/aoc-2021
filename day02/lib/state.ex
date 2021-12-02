defmodule State do
  defstruct position: 0, depth: 0

  def new do
    %__MODULE__{}
  end

  def advance(state, forward: value) do
    %{state | position: state.position + value}
  end

  def advance(state, down: value) do
    %{state | depth: state.depth + value}
  end

  def advance(state, up: value) do
    %{state | depth: state.depth - value}
  end
end
