
class Player

  VERSION = "Default Ruby folding player"

  def bet_request(game_state)
    player_in_action = game_state["in_action"]
    game_state["current_buy_in"] - game_state["players"][player_in_action]["bet"]
  end

  def showdown(game_state)

  end
end
