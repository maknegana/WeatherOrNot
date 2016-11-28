class CreateDayWeathers < ActiveRecord::Migration
  def change
    create_table :day_weathers do |t|
      t.integer :date
      t.integer :temp
      t.string :sky
      t.integer :precipitation
      t.integer :wind
      t.integer :humidity
      t.string :location

      t.timestamps null: false
    end
  end
end
