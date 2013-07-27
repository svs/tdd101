class AddMovesToGame < ActiveRecord::Migration
  def change
    add_column :games, :moves, :text
  end
end
