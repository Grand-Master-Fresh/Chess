class CreatePieces < ActiveRecord::Migration[5.2]
  def change
    create_table :pieces do |t|
      t.integer :id
      t.string :type
      t.integer :x_position
      t.integer :y_position
      t.integer :user_id
      t.integer :game_id
      t.timestamps
    end
  end
end
