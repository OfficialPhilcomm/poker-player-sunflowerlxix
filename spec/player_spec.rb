require "spec_helper"
require_relative "../player"

RSpec.describe Player do
  let(:game_state)  do
    {
      "in_action" => "User",
      "current_buy_in" => 100,
      "players" => { "User" => { "bet" => 100 } }
    }
  end

  it "works" do
    expect { Player.new.bet_request(game_state) }.not_to raise_error
  end
end
