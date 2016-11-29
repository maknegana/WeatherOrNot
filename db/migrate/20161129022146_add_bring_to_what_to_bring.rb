class AddBringToWhatToBring < ActiveRecord::Migration
  def change
    add_column :what_to_brings, :bring, :integer
  end
end
