class CreatePieces < ActiveRecord::Migration[5.2]
  def change
    create_table :pieces do |t|
      t.integer  "x_position"
      t.integer  "y_position"
      t.string   "symbol"
      t.boolean  "color"
      t.integer  "user_id"
      t.integer  "game_id"
      t.string   "type"
      t.string   "state"
      t.timestamps
    end
  end
end
