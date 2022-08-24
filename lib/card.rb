class Card
  attr_accessor :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def self.from_json(json)
    new(json["rank"], json["suit"])
  end

  def over_nine?
    %w[10 J Q K A].include? @rank
  end
end
