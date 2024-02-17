defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck/0 creates a deck of cards" do
    assert Cards.create_deck() == [
      "2 of Hearts", "3 of Hearts", "4 of Hearts", "5 of Hearts", "6 of Hearts",
      "7 of Hearts", "8 of Hearts", "9 of Hearts", "10 of Hearts", "J of Hearts",
      "Q of Hearts", "K of Hearts", "A of Hearts", "2 of Diamonds", "3 of Diamonds",
      "4 of Diamonds", "5 of Diamonds", "6 of Diamonds", "7 of Diamonds",
      "8 of Diamonds", "9 of Diamonds", "10 of Diamonds", "J of Diamonds",
      "Q of Diamonds", "K of Diamonds", "A of Diamonds", "2 of Clubs", "3 of Clubs",
      "4 of Clubs", "5 of Clubs", "6 of Clubs", "7 of Clubs", "8 of Clubs",
      "9 of Clubs", "10 of Clubs", "J of Clubs", "Q of Clubs", "K of Clubs",
      "A of Clubs", "2 of Spades", "3 of Spades", "4 of Spades", "5 of Spades",
      "6 of Spades", "7 of Spades", "8 of Spades", "9 of Spades", "10 of Spades",
      "J of Spades", "Q of Spades", "K of Spades", "A of Spades"
    ]
  end

test "shuffle/1 shuffles the deck" do
  deck = Cards.create_deck()
  shuffled = Cards.shuffle(deck)
  refute deck == shuffled
end

test "deal/2 deals n cards from the deck" do
  deck = Cards.create_deck()
  {hand, rest} = Cards.deal(deck, 5)
  assert length(hand) == 5
  assert length(rest) == 47
end

test "draw/1 draws a card from the deck" do
  deck = Cards.create_deck()
  {card, rest} = Cards.draw(deck)
  assert is_binary(card)
  assert length(rest) == 51
end

test "save/2 saves the deck to a file" do
  deck = Cards.create_deck()
  assert Cards.save(deck, "deck.txt") == :ok
end

test "load/1 loads the deck from a file" do
  {:ok, deck} = Cards.load("deck.txt")
  assert length(deck) == 52
end

## 5.3.3. Running the tests
# Run the tests with the following command:
# $ mix test
end
