class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :player_one_name
      t.string :player_two_name

      t.timestamps
    end
  end
end
