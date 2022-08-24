class PairEvaluator
  attr_reader :pair, :game_state

  def initialize(pair, game_state)
    @pair = pair
    @game_state = game_state
    @value = @pair[0].rank
    @me = OpenStruct.new(game_state.players[game_state.in_action])
  end

  def high_value?
    %w[10 J Q K A ].include? @value
  end

  def evaluate
      if high_value?
        ["raise", @game_state.current_buy_in - @me.bet + (@me.stack * 0.4)]
      else
        ["call"]
      end
    end
end
