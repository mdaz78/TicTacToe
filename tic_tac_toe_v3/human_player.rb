class HumanPlayer
  attr_reader :mark

  def initialize(mark_value)
    @mark = mark_value
  end

  def get_position(legal_positions)
    position = []
    loop do
      error_message = 'sorry! that was invalid! :( Please try another number'
      puts "Player #{mark}, enter two numbers representing a position in the format `row col`"
      position = gets.chomp
      raise error_message unless is_position_input_valid?(position)
      x, y = position[0].to_i, position[-1].to_i
      position = [x, y]
      break if legal_positions.include?(position)
    end
    position
  end

  def is_position_input_valid?(position)
    return false if position.length != 3

    alphabets = ('a'..'z').to_a

    !(
      alphabets.include?(position[0]) || alphabets.include?(position[2]) ||
        position[1] != ' '
    )
  end
end
