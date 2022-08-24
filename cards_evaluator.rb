class CardsEvaluator
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def evaluate

  end

  private

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
      card.suite
    end.tally.select do |suite, count|
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
    
  end
end