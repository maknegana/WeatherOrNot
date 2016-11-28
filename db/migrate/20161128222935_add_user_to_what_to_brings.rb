class AddUserToWhatToBrings < ActiveRecord::Migration
  def change
    add_reference :what_to_brings, :user, index: true, foreign_key: true
  end
end
