defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello()
      :world

  """
  def create_deck do
    values = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"]
    suits = ["Hearts", "Diamonds", "Clubs", "Spades"]
    for suit <- suits, value <- values, do:
      "#{value} of #{suit}"

  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, n) do
    {hand, rest} = Enum.split(deck, n)
    {hand, rest}
  end

  def draw(deck) do
    {card, _} = Enum.split(deck, 1)
    card
  end

  def save(deck, file) do
    binary =:erlang.term_to_binary(deck)
    File.write(file, binary)
  end

def load(file) do
  case File.read(file) do
    {:ok, binary} -> {:ok, :erlang.binary_to_term(binary)}
    {:error, status} -> {:error, status}
  end
end

end
