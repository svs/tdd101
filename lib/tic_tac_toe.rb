require_relative './board.rb'
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
    won?
  end

  def won?
    board.won?
  end

  def winner
    players[board.winning_player] if won?
  end

  def add_player(name)
    raise ArgumentError if started?
    players << name
  end

  private

  def board
    Board.new(moves)
  end

  def last_player
    (players - [current_player]).first
  end


end
