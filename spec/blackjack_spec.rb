require "pry"
require_relative '../blackjack'

describe Deck do
  let(:deck) { Deck.new } # creates a variable that can be used for tests

  describe "#build_deck" do
    it "builds a deck of 52 cards" do
      expect(deck.cards.size).to eq 52
    end

    it "creates unique cards" do
      expect(deck.cards.uniq.size).to eq 52
    end

    it "shuffles deck aftering being built" do
      expect(deck.cards.sort).to_not eq deck.cards

      # it is good not to rely on negative tests alone
      # so we assert that after sorting the deck it looks like we expect
      expect(deck.cards.sort[0..1]).to eq ["10♠", "10♣"]
    end
  end

  describe "#deal" do
    it "removes correct number of cards" do
      start_size = deck.cards.size
      finish_size = start_size - 2

      deck.deal(2)

      expect(deck.cards.size).to eq finish_size
    end

    it "deals the top card in the deck" do
      correct_card = deck.cards[-1]
      expect(deck.deal(1)).to eq [correct_card]
    end
  end
end

# These will be useful for making different hands
# '♦', '♣', '♠', '♥'

describe Hand do
  let(:hand0) { Hand.new(["10♦", "J♥"]) }
  let(:hand1) { Hand.new(["2♦", "J♥" , "4♥"]) }
  let(:hand2) { Hand.new(["2♦", "J♥" , "4♥" , "5♣"]) }
  let(:hand3) { Hand.new(["A♦", "J♥"]) }
  let(:hand4) { Hand.new(["A♦", "J♥" , "4♣"]) }

  describe "#calculate_hand" do
    it "10♦, J♥" do
      expect(hand0.calculate_hand).to eq(20)
    end

    it "2♦, J♥ , 4♥" do
      expect(hand1.calculate_hand).to eq (16)
    end

    it "2♦, J♥ , 4♥" do
      expect(hand2.calculate_hand).to eq (21)
    end

    it "A♦, J♥" do
      expect(hand3.calculate_hand).to eq (21)
    end

    it "A♦, J♥ , 4♥" do
      expect(hand4.calculate_hand).to eq (15)
    end
  end
end
