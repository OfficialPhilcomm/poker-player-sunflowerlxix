class CardsEvaluator
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def evaluate

  end

  def pair?
    cards.map do |card|
      card.rank
    end.tally.select do |rank, count|
      count == 2
    end.any?
  end

  def two_pair?

  end

  def three_of_a_kind?
    cards.map do |card|
      card.rank
    end.tally.select do |rank, count|
      count == 3
    end.any?
  end

  def straight?

  end

  def flush?
    cards.map do |card|
      card.suit
    end.tally.select do |suit, count|
      count == 5
    end.any?
  end

  def full_house?

  end

  def four_of_a_kind?
    cards.map do |card|
      card.rank
    end.tally.select do |rank, count|
      count == 4
    end.any?
  end

  def straight_flush?

  end

  def royal_flush?
    %w[hearts spades clubs diamonds].map do |suit|
      cards.select do |card|
        card.suit == suit
      end.map do |card|
        ["10", "J", "Q", "K", "A"].include? card.suit
      end.count
    end.select do |card_count|
      card_count == 5
    end.any?
  end
end
