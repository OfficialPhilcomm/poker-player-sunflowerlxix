require "spec_helper"
require "json"
require_relative "../player"

RSpec.describe Player do
  let(:game_state)  do
    JSON.parse(File.read("spec/files/game_state.json"))
  end

  it "works" do
    expect { Player.new.bet_request(game_state) }.not_to raise_error
  end
end
