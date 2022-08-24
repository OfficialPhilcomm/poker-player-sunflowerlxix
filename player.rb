require_relative "./lib/card"
require_relative "./lib/cards_evaluator"

class Player
  VERSION = "How dare you Patrick!"

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
        raise_by(game_state, 10)
      else
        call(game_state)
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
      all_in(game_state)
    elsif evaluator.three_of_a_kind? && me.bet > 200
      raise_by(game_state, 20)
    elsif evaluator.three_of_a_kind? && me.bet > 400
    else
      call(game_state)
    end
  end

  def call(game_state)
    me = OpenStruct.new(game_state.players[game_state.in_action])

    game_state.current_buy_in - me.bet
  end

  def raise_by(game_state, raise_by)
    me = OpenStruct.new(game_state.players[game_state.in_action])

    raise_by = [me.stack, raise_by].min

    game_state.current_buy_in - me.bet + raise_by
  end

  def fold(game_state)
    game_state.current_buy_in
  end

  def all_in(game_state)
    me = OpenStruct.new(game_state.players[game_state.in_action])

    me.stack
  end
end
