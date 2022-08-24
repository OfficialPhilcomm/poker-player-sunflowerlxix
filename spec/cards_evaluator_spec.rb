require "spec_helper"
require_relative "../lib/card"
require_relative "../lib/cards_evaluator"

RSpec.describe CardsEvaluator do
  subject { described_class.new(cards) }
  let(:cards) do
    []
  end

  describe "royal_flush?" do
    context "match" do
      let(:cards) do
        [
          Card.new("10", "hearts"),
          Card.new("J", "hearts"),
          Card.new("Q", "hearts"),
          Card.new("K", "hearts"),
          Card.new("A", "hearts")
        ]
      end
      it "matches" do
        expect(subject).to be_royal_flush
      end
    end

    context "no match" do
      let(:cards) do
        [
          Card.new("10", "hearts"),
          Card.new("J", "hearts"),
          Card.new("Q", "hearts"),
          Card.new("K", "diamonds"),
          Card.new("A", "hearts")
        ]
      end
      it "matches" do
        expect(subject).not_to be_royal_flush
      end
    end
  end

  describe "three_of_a_kind?" do
    context "match" do
      let(:cards) do
        [
          Card.new("10", "clubs"),
          Card.new("10", "spades"),
          Card.new("10", "hearts")
        ]
      end
      it "matches" do
        expect(subject).to be_three_of_a_kind
      end
    end

    context "no match" do
      let(:cards) do
        [
          Card.new("9", "spades"),
          Card.new("10", "hearts"),
          Card.new("A", "hearts")
        ]
      end

      it "doesn't match" do
        expect(subject).not_to be_three_of_a_kind
      end
    end

  end

  describe "pair?" do
    context "match" do
      let(:cards) do
        [
          Card.new("9", "spades"),
          Card.new("A", "spades"),
          Card.new("J", "spades"),
          Card.new("10", "spades"),
          Card.new("10", "hearts")
        ]
      end
      it "matches" do
        expect(subject).to be_pair
      end
    end

    context "no match" do
      let(:cards) do
        [
          Card.new("9", "spades"),
          Card.new("10", "hearts")
        ]
      end

      it "doesn't match" do
        expect(subject).not_to be_pair
      end
    end
  end

  describe "two_pair?" do
    context "match" do
      let(:cards) do
        [
          Card.new("9", "spades"),
          Card.new("9", "clubs"),
          Card.new("10", "spades"),
          Card.new("10", "hearts")
        ]
      end
      it "matches" do
        expect(subject).to be_two_pair
      end
    end

    context "no match" do
      let(:cards) do
        [
          Card.new("9", "spades"),
          Card.new("10", "hearts")
        ]
      end

      it "doesn't match" do
        expect(subject).not_to be_two_pair
      end
    end
  end
end
