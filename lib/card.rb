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

  def value
    {
      "2" => 2
      "3" => 3
      "4" => 4
      "5" => 5
      "6" => 6
      "7" => 7
      "8" => 8
      "9" => 9
      "10" => 10
      "J" => 11
      "Q" => 12
      "K" => 13
      "A" => 14
    }
  end
end
