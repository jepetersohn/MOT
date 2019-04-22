class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :body, null: false
      t.integer :reviewer_id, null: false
      t.integer :movie_id, null: false
      t.timestamps null: false
    end
  end
end
