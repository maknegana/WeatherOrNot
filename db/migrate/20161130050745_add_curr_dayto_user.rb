class AddCurrDaytoUser < ActiveRecord::Migration
  def change
  	add_column :users, :curr_day, :string

  end
end
