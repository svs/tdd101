class Board

  attr_reader :moves

  def initialize(moves)
    @moves = moves
  end

  def won?
    rows_won? || columns_won? || diagonals_won?
  end

  def player_one_moves
    moves.each_slice(2).map(&:first)
  end

  def player_two_moves
    moves - player_one_moves
  end

  def rows
    result = all_moves.dup
    all_moves.each_with_index do |row,i|
      row.each_with_index do |col,j|
        result[i][j] = 0 if player_one_moves.include?([i,j])
        result[i][j] = 1 if player_two_moves.include?([i,j])
      end
    end
    result
  end

  def columns
    rows.transpose
  end

  def diagonals
    [[rows[0][0], rows[1][1], rows[2][2]], [rows[0][2], rows[1][1], rows[2][0]]]
  end

  def winning_row
    rows.map{|row|
      row == [1,1,1] || row == [0,0,0]
    }.index(true)
  end

  def winning_player
    rows[winning_row][0]
  end

  def columns_won?
  end

  def rows_won?
    winning_row
  end

  def diagonals_won?
  end

  private

  def all_moves
    [[nil,nil,nil],[nil,nil,nil],[nil,nil,nil]]
  end

end
