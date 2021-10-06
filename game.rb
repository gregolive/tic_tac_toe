# rubocop:disable Style/FrozenStringLiteralComment

require './logic'
require './messages'

# Play a game of tic tac toe
class Game
  include InputLogic
  include Messages
  include WinConditions
  attr_reader :name, :marker

  START = [true, false].freeze

  def initialize
    @round = 0
    @board = board
    @board_list = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @winner = false
    @player1 = []
    @player2 = []
  end

  def start
    intro
    play
  end

  def intro
    puts setup[0]
    @player1 = create_player(setup[1], '')
    @player2 = create_player(setup[2], @player1[0])
  end

  def create_player(message, p1_marker)
    puts message
    name = create_name
    marker = create_marker(p1_marker)
    [marker, name]
  end

  def play
    p1_turn = START[rand(-1..0)]
    while @round < 9 && @winner == false
      p1_turn == true ? play_round(@player1) : play_round(@player2)
      p1_turn = !p1_turn
    end
    return unless @winner == false

    puts in_game[1]
    puts in_game[2]
  end

  def play_round(player)
    make_a_move(player)
    check_winner(player[1])
  end

  def make_a_move(player)
    @round += 1
    puts round_display(@round)
    print whos_turn(player[1])
    puts @board
    print in_game[0]
    change_board(player[0])
  end

  def change_board(marker)
    number = gets.chomp
    while @board_list.include?(number.to_i) == false
      print error_message[2]
      print in_game[0]
      number = gets.chomp
    end
    sub_number(number, marker)
  end

  def sub_number(number, marker)
    @board_list.map! do |e|
      e == number.to_i ? marker : e
    end
    @board = @board.sub! number, marker
  end

  def check_winner(name)
    return unless horizontal_win(@board_list) || vertical_win(@board_list) || diagonal_win(@board_list)

    @winner = true
    puts in_game[1]
    puts @board
    game_over(name)
  end
end

# rubocop:enable Style/FrozenStringLiteralComment
