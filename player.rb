require_relative "./lib/card"
require_relative "./lib/cards_evaluator"

class Player
  VERSION = "How dare you Ali!"

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

    cards = me.hole_cards.map do |hole_card|
      Card.from_json(hole_card)
    end

    has_value_card = cards.select do |card|
      card.over_nine?
    end.any?

    evaluator = CardsEvaluator.new(cards)

    if has_value_card
      if evaluator.pair? && me.bet > 50
        game_state.current_buy_in - me.bet + 10
      else
        game_state.current_buy_in - me.bet
      end
    else
      0
    end
  end

  def handle_other_rounds(game_state)
    me = OpenStruct.new(game_state.players[game_state.in_action])

    all_cards = me.hole_cards.map do |hole_card|
      Card.from_json(hole_card)
    end + game_state.community_cards.map do |community_card|
      Card.from_json(community_card)
    end

    evaluator = CardsEvaluator.new(all_cards)

    if evaluator.royal_flush?
      me.stack
    elsif evaluator.three_of_a_kind?
      game_state.current_buy_in - me.bet + 20
    else
      game_state.current_buy_in - me.bet
    end
  end
end
