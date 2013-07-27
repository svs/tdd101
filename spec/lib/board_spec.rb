require 'rspec'
require './lib/board.rb'

describe Board do

  let(:row_winning_moves) {[[0,0],[1,1],[0,1],[2,2],[0,2]]}

  describe "empty board" do
    subject { Board.new([]) }
    it { should_not be_won }
  end

  subject { Board.new(row_winning_moves) }

  its(:player_one_moves) { should == [[0,0],[0,1],[0,2]] }
  its(:player_two_moves) { should == [[1,1],[2,2]] }
  its(:rows) { should == [
                          [0,0,0],
                          [nil,1,nil],
                          [nil,nil,1]]
  }

  its(:columns) { should == [
                          [0,nil,nil],
                          [0,1,nil],
                          [0,nil,1]]
  }

  its(:diagonals) { should == [[0,1,1],[0,1,nil]] }
  its(:winning_row) { should == 0 }
  its(:winning_player) { should == 0 }
  it { should_not be_columns_won}
  it { should be_rows_won }
  it { should_not be_diagonals_won }
  it { should be_won }


end
