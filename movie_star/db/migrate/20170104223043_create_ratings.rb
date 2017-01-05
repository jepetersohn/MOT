class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :score, null: false
      t.integer :rater_id, null: false
      t.integer :review_id, null: false

      t.timestamps null: false
    end
  end
end
