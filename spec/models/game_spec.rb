require 'spec_helper'

describe Game do

  it { should validate_presence_of(:player_one_name) }
  it { should validate_presence_of(:player_two_name) }


end
