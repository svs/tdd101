class TicTacToe

  attr_accessor :players, :moves

  def initialize
    @players = []
    @moves = []
  end

  def current_player
    players[moves.count % 2] if started?
  end

  def started?
    players.count == 2
  end

  def add_move(x,y)
    raise ArgumentError unless started?
    raise ArgumentError if moves.include?([x,y])
    raise ArgumentError.new("Moves should be between [0,0] and [2,2]") if (x < 0 || x > 2 || y < 0 || y > 2)
    moves << [x,y]
  end

  def finished?
  end

  def won?
    columns_won? || rows_won? || diagonals_won?
  end

  def winner
  end

  def add_player(name)
    raise ArgumentError if started?
    players << name
  end

  private

  def columns_won?
  end

  def rows_won?
    (0 .. 2).any? { |row| moves.each_slice(2).map(&:first).map(&:first).select { |x| x == row }.compact.count == 3 }
  end

  def diagonals_won?
  end


end
