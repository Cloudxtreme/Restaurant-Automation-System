class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :num_stars
      t.integer :num_times_rated
      t.timestamps
    end
  end
end
