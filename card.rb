class Card
  attr_accessor :rank, :suite

  def initialize(rank, suite)
    @rank = rank
    @suite = suite
  end

  def over_nine?
    %w[10 J Q K A].include? @rank
  end
end
