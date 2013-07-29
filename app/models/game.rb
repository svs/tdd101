class Game < ActiveRecord::Base
  attr_accessible :player_one_name, :player_two_name, :x, :y
  validates :player_one_name, presence: true
  validates :player_two_name, presence: true
  serialize :moves

  before_validation :handle_x_y
  validate :check_moves

  attr_accessor :x, :y

  def handle_x_y
    self.moves ||= []
    return true unless x && y
    self.moves << [x.to_i, y.to_i]
  end

  def check_moves
    begin
      moves.each do |m|
        tictactoe.add_move(*m.map(&:to_i))
      end
    rescue ArgumentError => e
      ap e
      self.errors.add(:moves, "Invalid move added: #{e.message}")
    end
  end

  private
  def tictactoe
    @_tictactoe ||= ::TicTacToe.new.tap do |t|
      t.add_player(player_one_name)
      t.add_player(player_two_name)
    end

  end

end
