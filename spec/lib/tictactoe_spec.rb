require 'rspec'
require './lib/tictactoe.rb'

describe TicTacToe do

  context "at the start" do
    let(:game) { TicTacToe.new }
    let(:game_with_one_player) { game.tap{|g| g.add_player("foo") } }
    let(:game_with_two_players) { game_with_one_player.tap{|g| g.add_player("bar") } }
    subject { game }

    its(:moves) { should be_empty }
    its(:players) { should be_empty }

    it { should_not be_started }
    it { should_not be_finished }
    it { should_not be_won }
    its(:winner) { should be_nil }
    its(:current_player) { should be_nil }
    it "should not accept moves" do
      expect { game.add_move(1,1) }.to raise_error(ArgumentError)
    end

    describe "game with one player" do
      subject { game_with_one_player }
      its(:players) { should == ["foo"] }
      it { should_not be_started }
      it { should_not be_finished }
      it { should_not be_won }
      its(:winner) { should be_nil }
      its(:current_player) { should be_nil }
      it "should not accept moves" do
        expect { game.add_move(1,1) }.to raise_error(ArgumentError)
      end

    end

    describe "game with two players" do
      subject { game_with_two_players }
      its(:players) { should == ["foo","bar"] }
      it "should not allow adding a third player" do
        expect { game_with_two_players.add_player("baz") }.to raise_error
      end
      it { should be_started }
      it { should_not be_finished }
      it { should_not be_won }
      its(:winner) { should be_nil }
      its(:current_player) { should == "foo" }
      specify { expect { subject.add_move(1,1) }.to_not raise_error }
      it "should add moves" do
        subject.add_move(1,1)
        #subject.moves.should ==
      end


    end

  end
end
