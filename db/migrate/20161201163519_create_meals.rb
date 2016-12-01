class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.string :name
      t.text :description
      t.float :price
      t.integer :number_times_ordered
      t.timestamps
    end
  end
end
