require_relative "./lib/card"
require_relative "./lib/cards_evaluator"

class Player
  VERSION = "Come at us!"

  def bet_request(game_state)
    game_state = OpenStruct.new(game_state)

    if game_state.community_cards&.any?
      handle_first_round(game_state)
    else
      handle_other_rounds(game_state)
    end
  end

  def showdown(game_state)

  end

  def handle_first_round(game_state)
    me = OpenStruct.new(game_state.players[game_state.in_action])

    has_value_card = me.hole_cards.select do |hole_card|
      Card.from_json(hole_card).over_nine?
    end.any?

    if has_value_card
      game_state.current_buy_in - me.bet
    else
      0
    end
  end

  def handle_other_rounds(game_state)
    me = OpenStruct.new(game_state.players[game_state.in_action])

    game_state.current_buy_in - me.bet
  end
end
