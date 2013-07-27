class Game < ActiveRecord::Base
  attr_accessible :player_one_name, :player_two_name
  validates :player_one_name, presence: true
  validates :player_two_name, presence: true
end
