class ComputerPlayer
  attr_reader :mark

  def initialize(mark_value)
    @mark = mark_value
  end

  def get_position(legal_positions)
    x, y = legal_positions.sample
    puts "Computer #{mark} choose position [#{x}, #{y}]"
    [x, y]
  end
end
