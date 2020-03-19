require_relative 'board'
require_relative 'human_player'

class Game
  def initialize(player_1_mark, player_2_mark)
    @board = Board.new
    @player_1 = HumanPlayer.new(player_1_mark)
    @player_2 = HumanPlayer.new(player_2_mark)
    @current_player = @player_1
  end

  def switch_turn
    @current_player = @current_player == @player_1 ? @player_2 : @player_1
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
