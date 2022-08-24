
class Player

  VERSION = "Very good version"

  def bet_request(game_state)
    me = game_state["players"][game_state["in_action"]]

    has_value_card = me["hole_cards"].select do |hole_card|
      ["10", "J", "Q", "K", "A"].include? hole_card["rank"]
    end.any?

    if has_value_card
      game_state["current_buy_in"] - me["bet"]
    else
      0
    end
  end

  def showdown(game_state)

  end
end
