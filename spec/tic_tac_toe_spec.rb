# frozen_string_literal: true

require_relative '../game'
require_relative '../logic'
require_relative '../messages'

describe Game do
  # 1. Make sure players win when they should
  subject(:game_over) { described_class.new }

  context "when a player gets 3 in a row" do
    describe '#horizontal_win' do
      it 'returns true when a row contains identical markers' do
        result = game_over.horizontal_win(['X', 'X', 'X', 4, 5, 6, 7, 8, 9])
        expect(result).to be_truthy
      end
    end

    describe '#vertical_win' do
      it 'returns true when a column contains identical markers' do
        result = game_over.vertical_win(['X', 2, 3, 'X', 5, 6, 'X', 8, 9])
        expect(result).to be_truthy
      end
    end

    describe '#diagonal_win' do
      it 'returns true when a diagonal contains identical markers' do
        result = game_over.diagonal_win(['X', 2, 3, 4, 'X', 6, 7, 8, 'X'])
        expect(result).to be_truthy
      end
    end
  end

  # 1. Test each critical method to make sure it functions properly and handles edge cases
  subject(:game_critical) { described_class.new }

  
end