# rubocop:disable Style/FrozenStringLiteralComment

# Output to user
module Messages
  def setup
    [
      "――――――――――――――――― RETRO TIC TAC TOE ―――――――――――――――――\n",
      "\nPLAYER 1",
      "\nPLAYER 2",
      'Enter your name: ',
      'Type one non-number character for your game marker: ',
      'Enter your name: ',
      'Type one non-number character for your game marker: '
    ]
  end

  def in_game
    [
      "\nChoose a number to place your marker: ",
      "\n――――――――――――――――――――― GAME OVER ―――――――――――――――――――――\n\n",
      "It's a tie!\n"
    ]
  end

  def error_message
    [
      'ERROR: Marker can only be 1 non-number character.',
      'ERROR: Player 1 is already using this marker',
      'ERROR: You must choose a number from the board.'
    ]
  end

  def board
    "1 | 2 | 3\n―――――――――\n4 | 5 | 6\n―――――――――\n7 | 8 | 9"
  end

  def round_display(round)
    "\n―――――――――――――――――――――― ROUND #{round} ――――――――――――――――――――――"
  end

  def whos_turn(name)
    "\n#{name}'s turn.\n\n"
  end

  def game_over(name)
    puts "\nCONGRATS! #{name} is the winner!\n\n"
  end
end

# rubocop:enable Style/FrozenStringLiteralComment
