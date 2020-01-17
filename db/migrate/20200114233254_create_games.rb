class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :white_player_id
      t.integer :black_player_id
      t.string :name
      t.integer :state
      t.timestamps
    end
  end
end
