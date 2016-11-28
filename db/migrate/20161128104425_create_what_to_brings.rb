class CreateWhatToBrings < ActiveRecord::Migration
  def change
    create_table :what_to_brings do |t|
      t.string :weather
      t.integer :top
      t.integer :bottom
      t.integer :shoes
      t.integer :hands
      t.integer :head
      t.integer :eyes
      t.integer :ears
      t.integer :neck

      t.timestamps null: false
    end
  end
end
