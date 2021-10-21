# frozen_string_literal: true

require_relative '../game'
require_relative '../logic'
require_relative '../messages'

# rubocop:disable Metrics/BlockLength

describe Game do
  # Make sure players win when they should
  subject(:game_over) { described_class.new }

  context 'when a player gets 3 in a row' do
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

  # Only allow proper marker input
  subject(:in_game) { described_class.new }

  context 'when marker is entered' do
    describe '#length_check' do
      it 'should return false if the marker is one character' do
        marker = 'F'
        check = in_game.length_check(marker)
        expect(check).to be_falsey
      end

      it 'should return true if the marker is more than one character' do
        marker = 'FB'
        check = in_game.length_check(marker)
        expect(check).to be_truthy
      end
    end

    describe '#number_check' do
      it 'should return false if the marker is a non-number' do
        marker = 'F'
        check = in_game.number_check(marker)
        expect(check).to be_falsey
      end

      it 'should return true if the marker is a number' do
        marker = '1'
        check = in_game.number_check(marker)
        expect(check).to be_truthy
      end
    end

    describe '#check_duplicate' do
      it 'should return false if the marker is not used by player 1' do
        p1_marker = 'G'
        marker = 'F'
        check = in_game.check_duplicate(marker, p1_marker)
        expect(check).to be_falsey
      end

      it 'should return true if the marker is used by player 1' do
        p1_marker = 'F'
        marker = 'F'
        check = in_game.check_duplicate(marker, p1_marker)
        expect(check).to be_truthy
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
