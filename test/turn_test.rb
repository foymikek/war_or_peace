require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTest < MiniTest::Test
  def test_it_exists
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)

    assert_instance_of Turn, turn
  end

  def test_it_has_readable_attributes
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)

    assert_equal turn.player1, player1
    assert_equal turn.player2, player2
    assert_equal turn.spoils_of_war, []
  end

  def test_type_mutually_assured_destruction
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)

    assert_equal player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2), true
  end

  def test_type_war
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)

    assert_equal player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0), true
  end

  def test_type_basic
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)

    assert_equal player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0), true
  end

  def test_winner_mutually_assured_destruction
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)

    assert_equal turn.winner, "No Winner"
  end

  def test_winner_war
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)
    winner = turn.winner

    assert_equal turn.winner, player2
  end

  def test_winner_basic
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)

    assert_equal turn.winner, player1
  end

  def test_pile_cards_mutaually_assured_destruction
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)
    turn.pile_cards

    assert_equal player1.deck.cards, [card8]
    assert_equal player2.deck.cards, [card7]
  end

  def test_pile_cards_war
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)

    turn = Turn.new(player1, player2)
    winner = turn.winner
    turn.pile_cards

# TODO order of the cards is not tested here.
   assert_equal turn.spoils_of_war.include?(card1), true
   assert_equal turn.spoils_of_war.include?(card2), true
   assert_equal turn.spoils_of_war.include?(card5), true
   assert_equal turn.spoils_of_war.include?(card4), true
   assert_equal turn.spoils_of_war.include?(card3), true
   assert_equal turn.spoils_of_war.include?(card6), true
  end

  def test_pile_cards_basic
  card1 = Card.new(:heart, 'Jack', 11)
  card2 = Card.new(:heart, '10', 10)
  card3 = Card.new(:heart, '9', 9)
  card4 = Card.new(:diamond, 'Jack', 11)
  card5 = Card.new(:heart, '8', 8)
  card6 = Card.new(:diamond, 'Queen', 12)
  card7 = Card.new(:heart, '3', 3)
  card8 = Card.new(:diamond, '2', 2)

  deck1 = Deck.new([card1, card2, card5, card8])
  deck2 = Deck.new([card3, card4, card6, card7])

  player1 = Player.new('Megan', deck1)
  player2 = Player.new('Aurora', deck2)

  turn = Turn.new(player1, player2)
  winner = turn.winner
  turn.pile_cards

  assert_equal turn.spoils_of_war, [card1, card3]
  end

  def test_award_spoils_mutually_assured_destruction
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)

    assert_equal player1.deck.cards, [card8]
    assert_equal player2.deck.cards, [card7]
  end

  def test_award_spoils_war
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)

    turn = Turn.new(player1, player2)
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)
    # TODO order of the cards is not tested here.
    assert_equal player1.deck.cards.include?(card8), true
    assert_equal player2.deck.cards.include?(card1), true
    assert_equal player2.deck.cards.include?(card2), true
    assert_equal player2.deck.cards.include?(card3), true
    assert_equal player2.deck.cards.include?(card4), true
    assert_equal player2.deck.cards.include?(card5), true
    assert_equal player2.deck.cards.include?(card6), true
    assert_equal player2.deck.cards.include?(card7), true
  end

  def test_award_spoils_basic
   card1 = Card.new(:heart, 'Jack', 11)
   card2 = Card.new(:heart, '10', 10)
   card3 = Card.new(:heart, '9', 9)
   card4 = Card.new(:diamond, 'Jack', 11)
   card5 = Card.new(:heart, '8', 8)
   card6 = Card.new(:diamond, 'Queen', 12)
   card7 = Card.new(:heart, '3', 3)
   card8 = Card.new(:diamond, '2', 2)

  deck1 = Deck.new([card1, card2, card5, card8])
  deck2 = Deck.new([card3, card4, card6, card7])

  player1 = Player.new('Megan', deck1)
  player2 = Player.new('Aurora', deck2)
  turn = Turn.new(player1, player2)

  winner = turn.winner
  turn.pile_cards
  turn.award_spoils(winner)
# TODO order of the cards is not tested here.
  assert_equal player1.deck.cards.include?(card1), true
  assert_equal player1.deck.cards.include?(card2), true
  assert_equal player1.deck.cards.include?(card3), true
  assert_equal player1.deck.cards.include?(card5), true
  assert_equal player1.deck.cards.include?(card8), true
  assert_equal player2.deck.cards.include?(card4), true
  assert_equal player2.deck.cards.include?(card6), true
  assert_equal player2.deck.cards.include?(card7), true
  end

end
