class Board
  def initialize
    @board = Array.new(3) { %w[_] * 3 }
  end

  def valid?(position)
    x, y = position
    height = @board.length
    width = @board.first.length
    is_positive = x >= 0 && y >= 0
    is_positive && x <= height && y <= width
  end

  def empty?(position)
    x, y = position
    @board[x][y] == '_'
  end

  def place_mark(position, mark)
    if valid?(position) && empty?(position)
      x, y = position
      @board[x][y] = mark
    else
      raise 'Position is invalid'
    end
  end

  def print
    @board.each { |row| p row }
  end

  def win_row?(mark)
    @board.any? { |row| row.count(mark) == 3 }
  end

  def win_col?(mark)
    @board.transpose.any? { |row| row.count(mark) == 3 }
  end

  def win_diagonal?(mark)
    left_diagonal = (0...@board.length).collect { |i| @board[i][i] }
    right_diagonal =
      @board.map.with_index do |row, i|
        index = row.length - (i + 1)
        row[index]
      end

    left_diagonal.count(mark) == 3 or right_diagonal.count(mark) == 3
  end

  def win?(mark)
    win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
  end

  def empty_positions?
    @board.flatten.each { |el| return true if el == '_' }
    false
  end
end
