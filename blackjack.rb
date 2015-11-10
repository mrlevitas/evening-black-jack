require "pry"
require_relative 'deck'


class Hand
  def initialize(cards)
    @cards = cards
  end

  def calculate_hand
    count = 0
    aces = 0

    @cards.each do |card|

      card_rank = card[0...-1]

      case card_rank
        when "J"
          count += 10
        when "Q"
          count += 10
        when "K"
          count += 10
        when "A"
          count += 11
          aces += 1
          # if (count + 11) > 21
          #   count += 1
          # else
          #   count += 11
          # end

        else
          count += card_rank.to_i

      end
    end

    while (aces > 0) && (count > 21)
      count -= 10
      aces -= 1
    end

  return count

  end

end

# deck = Deck.new
# cards = deck.deal(2)
# hand = Hand.new(cards)
# # hand.calculate_hand # Get this working properly
