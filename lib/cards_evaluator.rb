class CardsEvaluator
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def ranks_tally
    cards.map do |card|
      card.rank
    end.tally
  end

  def pair?
    ranks_tally.select do |rank, count|
      count == 2
    end.any?
  end

  def two_pair?
    ranks_tally.count do |rank, count|
      count == 2
    end >= 2
  end

  def three_of_a_kind?
    ranks_tally.select do |rank, count|
      count == 3
    end.any?
  end

  def straight?

  end

  def flush?
    ranks_tally.select do |suit, count|
      count == 5
    end.any?
  end

  def full_house?
    ranks_tally.value?(2) && ranks_tally.value?(3)
  end

  def four_of_a_kind?
    ranks_tally.select do |rank, count|
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
