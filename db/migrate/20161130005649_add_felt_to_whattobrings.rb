class AddFeltToWhattobrings < ActiveRecord::Migration
  def change
  	add_column :what_to_brings, :felt, :string
  end
end
