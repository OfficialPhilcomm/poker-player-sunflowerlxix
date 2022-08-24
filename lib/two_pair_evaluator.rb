class TwoPairEvaluator
  attr_reader :pair

  def initialize(pair)
    @pair = pair
  end

  def evaluate
    ["call"]
  end
end
