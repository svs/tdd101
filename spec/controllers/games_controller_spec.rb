require 'spec_helper'

describe GamesController do
  let(:valid_params) {{:player_one_name => "foo", :player_two_name => "bar" }}

  it "should open index" do
    get :index
    response.should render_template(:index)
    response.should be_ok
  end

  it "should create a new game" do
    expect { post :create, { :game => valid_params } }.to change(Game, :count).by(1) 
  end

  context "when there is a game" do
    let!(:game) { Game.create(valid_params)}
    it "should update a game" do
      put :update, { :id => game.id, :game => {:x => 1, :y => 1 } }
      game.reload.moves.should == [[1,1]]
    end

  end


end
