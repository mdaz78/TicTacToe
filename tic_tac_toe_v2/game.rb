require_relative 'board'
require_relative 'human_player'

class Game
  def initialize(board_size, *marks)
    @board = Board.new(board_size)
    @players = marks.map { |mark| HumanPlayer.new(mark) }
    @current_player = @players.first
  end

  def switch_turn
    @players.rotate!
    @current_player = @players.first
  end

  def play
    while @board.empty_positions?
      @board.print
      position = @current_player.get_position
      @board.place_mark(position, @current_player.mark)
      if @board.win?(@current_player.mark)
        puts "Hurray! #{@current_player.mark} wins the game"
        return
      else
        self.switch_turn
      end
    end

    return "It's a draw!"
  end
end
