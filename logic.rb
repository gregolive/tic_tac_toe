# rubocop:disable Style/FrozenStringLiteralComment

# Can win vertically, horizontally or diagonally
module WinConditions
  def all_same?(array)
    array.all? { |e| e == array[0] }
  end

  def horizontal_win(arr)
    return true if all_same?(arr[0..2]) || all_same?(arr[3..5]) || all_same?(arr[6..8])
  end

  def vertical_win(arr)
    column1 = [arr[0], arr[3], arr[6]]
    column2 = [arr[1], arr[4], arr[7]]
    column3 = [arr[2], arr[5], arr[8]]
    return true if all_same?(column1) || all_same?(column2) || all_same?(column3)
  end

  def diagonal_win(arr)
    diagonal1 = [arr[0], arr[4], arr[8]]
    diagonal2 = [arr[2], arr[4], arr[6]]
    return true if all_same?(diagonal1) || all_same?(diagonal2)
  end
end

# Input by user
module InputLogic
  # Accept any name input
  def create_name
    print setup[3]
    gets.chomp
  end

  # Create marker
  def create_marker(p1_marker)
    print setup[4]
    input = gets.chomp
    while length_check(input) || number_check(input) || check_duplicate(input, p1_marker)
      print setup[4]
      input = gets.chomp
    end
    input
  end

  # only allow one character
  def length_check(marker)
    if marker.length > 1
      puts error_message[0]
      true
    else
      false
    end
  end

  # don't allow numbers
  def number_check(marker)
    if marker == marker.to_i.to_s
      puts error_message[0]
      true
    else
      false
    end
  end

  # player 2 cant use the same marker as player 1
  def check_duplicate(marker, p1_marker)
    if marker == p1_marker
      puts error_message[1]
      true
    else
      false
    end
  end

  # Ask for move
  def ask_move(array, string)
    input = gets.chomp
    while array.include?(input) == false
      puts string
      input = gets.chomp
    end
    input
  end
end

# rubocop:enable Style/FrozenStringLiteralComment
