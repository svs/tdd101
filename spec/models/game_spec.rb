require 'spec_helper'

describe Game do

  it { should validate_presence_of(:player_one_name) }
  it { should validate_presence_of(:player_two_name) }

  context "when adding a move" do
    let(:game) { Game.new(player_one_name: "foo", player_two_name: "bar") }
    it "should not add a nil move " do
      game.save
      game.moves.should == []
    end

    it "should add a move " do
      game.x = 1
      game.y = 1
      game.save
      game.moves.should == [[1,1]]
    end

    context "when the game already has a move" do
      subject{  game.tap{ |g| g.update_attributes(x: 1, y: 1) }.reload }
      it "should not add a duplicate move " do
        subject.x = 1
        subject.y = 1
        subject.should_not be_valid
      end
    end

  end

end
