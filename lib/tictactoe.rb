class TicTacToe

  def initialize
    @players = @moves = []
  end

  def startable?
    @players.count == 2
  end

  def started?
    @started
  end

  def finished?
    won? || board_full?
  end

  def players
    @players
  end

  def winner
  end

  def add_player(player)
    @players << player
    @started = true if startable?
  end

  def current_player
    @players[@moves.count.odd? ? 1 : 0]
  end

  def add_move(x,y)
    raise ArgumentError.new("Invalid move") unless valid_move?(x,y)
    @moves << [x,y]
  end

  private

  def valid_move?(x,y)
    x >= 0 && x < 3 && 
      y >= 0 && y < 3 && 
      !@moves.include?([x,y])
  end

  def board_full?
    @moves.count == 9
  end

  def won?
    row_won? || column_won? || diagonals_won?
  end

  def first_players_moves
    moves.each_slice(2).map(&:first)
  end

  def second_players_moves
    moves.each_slice(2).map(&:last)
  end

  def row_won?
  end

  def column_won?
  end

  def diagonals_won?
  end

end
