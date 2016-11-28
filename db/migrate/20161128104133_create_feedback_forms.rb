class CreateFeedbackForms < ActiveRecord::Migration
  def change
    create_table :feedback_forms do |t|
      t.integer :feel
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
