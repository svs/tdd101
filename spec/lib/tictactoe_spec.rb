require 'rspec'
require './lib/tictactoe.rb'

describe TicTacToe do

  let(:new_game) { TicTacToe.new }
  let(:game_with_one_player) { new_game.tap{|g| g.add_player("foo") } }
  let(:game_with_two_players) { game_with_one_player.tap{|g| g.add_player("bar") } }
  
  context "with a brand new game" do
    subject { new_game }
    
    its(:players) { should be_empty }
    it { should_not be_startable }
    it { should_not be_started }
    it { should_not be_finished }
    its(:winner) { should be_nil }
    it { should respond_to :add_player}
  end

  context "with one player" do

    subject { game_with_one_player } 

    its(:players) { should == ["foo"] }
    it { should_not be_startable }
    it { should_not be_started }
    it { should_not be_finished }
    its(:winner) { should be_nil }

  end

  context "with two player" do

    subject { game_with_two_players }

    its(:players) { should == ["foo", "bar"] }
    it { should be_startable }
    it { should be_started }
    its(:current_player) { should == "foo" }
    it { should_not be_finished }
    its(:winner) { should be_nil }

  end

  context "started game" do
    subject { game_with_two_players }

    before(:each) { subject.add_move(1,1) }
    its(:current_player) { should == "bar" }
    it { should be_started }
    it { should_not be_finished }
    its(:winner) { should be_nil }

    it "should not add the same move twice" do
      expect { subject.add_move(1,1) }.to raise_error
    end
    
    it "should limit moves to the extent of the board" do
      expect { subject.add_move(3,3) }.to raise_error
      expect { subject.add_move(-1,-1) }.to raise_error
    end
  end

  context "finished game" do
    subject { game_with_two_players.tap{|g|

        [[1,1],[0,0],[0,1],[1,0],[2,1]].each do |x,y|
          g.add_move(x,y)
        end
      }
    }

    it { should be_finished }
    its(:winner) { should == "foo" }

  end


end

