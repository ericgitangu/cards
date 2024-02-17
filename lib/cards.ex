defmodule Cards do
  @moduledoc """
    Creates methods to shuffle, deal, draw, save, and load a deck of cards.  The deck is a list of strings, each string representing a card in the deck.
  """
  @doc """
    Creates a deck of cards.

    ## Examples

        iex> Cards.create_deck()
        ["2 of Hearts", "3 of Hearts", "4 of Hearts", "5 of Hearts", "6 of Hearts",
        "7 of Hearts", "8 of Hearts", "9 of Hearts", "10 of Hearts", "J of Hearts",
        "Q of Hearts", "K of Hearts", "A of Hearts", "2 of Diamonds", "3 of Diamonds",
        "4 of Diamonds", "5 of Diamonds", "6 of Diamonds", "7 of Diamonds",
        "8 of Diamonds", "9 of Diamonds", "10 of Diamonds", "J of Diamonds",
        "Q of Diamonds", "K of Diamonds", "A of Diamonds", "2 of Clubs", "3 of Clubs",
        "4 of Clubs", "5 of Clubs", "6 of Clubs", "7 of Clubs", "8 of Clubs",
        "9 of Clubs", "10 of Clubs", "J of Clubs", "Q of Clubs", "K of Clubs",
        "A of Clubs", "2 of Spades", "3 of Spades", "4 of Spades", "5 of Spades",
        "6 of Spades", "7 of Spades", "8 of Spades", "9 of Spades", "10 of Spades",
        "J of Spades", "Q of Spades", "K of Spades", "A of Spades"]
  """
  @spec create_deck() :: list()
  def create_deck() do
    suits = ["Hearts", "Diamonds", "Clubs", "Spades"]
    values = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]
    for suit <- suits, value <- values, do:
    "#{value} of #{suit}"
  end

  @doc """
    Shuffles the deck of cards. Returns a new list with the cards in a random order.
  """
  @spec shuffle(any()) :: list()
  def shuffle(deck) do
      # Your code for shuffling the deck goes here
    Enum.shuffle(deck)
  end

  @doc """
    Checks if a card is in the deck.

    ## Examples

        iex> deck = Cards.create_deck
        iex> Cards.contains?(deck, "2 of Hearts")
        true
        iex> Cards.contains?(deck, "2 of Diamonds")
        true
        iex> Cards.contains?(deck, "2 of Clubs")
        true
        iex> Cards.contains?(deck, "12 of Spades")
        false
  """
  @spec contains?(list(), any()) :: boolean()
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Deals n cards from the deck.
    Returns a tuple with the hand and the rest of the deck.

    ## Examples
        iex> deck = Cards.create_deck
        iex> {hand, rest} = Cards.deal(deck, 5)
        iex> hand
        ["2 of Hearts", "3 of Hearts", "4 of Hearts", "5 of Hearts", "6 of Hearts"]

  """
  @spec deal(list(), integer()) :: {list(), list()}
  def deal(deck, n) do
    {hand, rest} = Enum.split(deck, n)
    {hand, rest}
  end

  @doc """
    Draws a card from the deck.

    ## Examples
        iex> deck = Cards.create_deck
        iex> {card, rest} = Cards.draw(deck)
        iex> card
        "2 of Hearts"
  """
  @spec draw(list()) :: {any(), list()}
  def draw(deck) do
    {card, rest} = Enum.split(deck, 1)
    {Enum.at(card, 0), rest}
  end

  @doc """
    Saves the deck to a file.

    ## Examples
        iex> deck = Cards.create_deck
        iex> Cards.save(deck, "deck.txt")
  """
  @spec save(list(), String.t()) :: :ok
  def save(deck, file) do
    binary =:erlang.term_to_binary(deck)
    File.write(file, binary)
  end

  @doc """
    Loads the deck from a file.

    ## Examples
        iex> {:ok, deck} = Cards.load("deck.txt")
        iex> deck
        ["2 of Hearts", "3 of Hearts", "4 of Hearts", "5 of Hearts", "6 of Hearts", "7 of Hearts", "8 of Hearts", "9 of Hearts", "10 of Hearts", "J of Hearts", "Q of Hearts", "K of Hearts", "A of Hearts", "2 of Diamonds", "3 of Diamonds", "4 of Diamonds", "5 of Diamonds", "6 of Diamonds", "7 of Diamonds", "8 of Diamonds", "9 of Diamonds", "10 of Diamonds", "J of Diamonds", "Q of Diamonds", "K of Diamonds", "A of Diamonds", "2 of Clubs", "3 of Clubs", "4 of Clubs", "5 of Clubs", "6 of Clubs", "7 of Clubs", "8 of Clubs", "9 of Clubs", "10 of Clubs", "J of Clubs", "Q of Clubs", "K of Clubs", "A of Clubs", "2 of Spades", "3 of Spades", "4 of Spades", "5 of Spades", "6 of Spades", "7 of Spades", "8 of Spades", "9 of Spades", "10 of Spades", "J of Spades", "Q of Spades", "K of Spades", "A of Spades"]
  """
  @spec load(String.t()) :: {:ok, list()} | {:error, String.t()}
  def load(file) do
    case File.read(file) do
      {:ok, binary} -> {:ok, :erlang.binary_to_term(binary)}
      {:error, status} -> {:error, status.to_string()}
    end
  end

  @doc """
    Creates a hand of n cards, by creating a deck, shuffling it, and dealing n cards. Returns a tuple with the hand and the rest of the deck.
    Deals n cards from the deck in random order.
  """
  @spec hand_create(non_neg_integer()) :: {[any()], [any()]}
  def hand_create(size) do
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(size)
  end

end
