require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  def initialize(board_size, player_hash)
    @board = Board.new(board_size)
    # true means computer player, false means human player
    @players =
      player_hash.map do |mark, player_type|
        player_type ? ComputerPlayer.new(mark) : HumanPlayer.new(mark)
      end
    @current_player = @players.first
  end

  def switch_turn
    @players.rotate!
    @current_player = @players.first
  end

  def play
    while @board.empty_positions?
      @board.print
      position = @current_player.get_position(@board.legal_positions)
      @board.place_mark(position, @current_player.mark)
      if @board.win?(@current_player.mark)
        puts "Hurray! #{@current_player.mark} wins the game"
        return
      else
        self.switch_turn
      end
    end

    "It's a draw!"
  end
end
