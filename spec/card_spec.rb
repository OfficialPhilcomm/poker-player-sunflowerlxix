require "spec_helper"
require "json"
require_relative "../lib/card"

RSpec.describe Card do
  let(:over_nine_card) do
    Card.new("K","hearts")
  end

  let(:under_nine_card) do
    Card.new("2","hearts")
  end

  it "should return true" do
    expect(over_nine_card.over_nine?).to be_truthy
  end

  it "should return false" do
    expect(under_nine_card.over_nine?).to be_falsey
  end
end
