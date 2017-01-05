class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.integer :year
      t.string :actors
      t.string :runtime
      t.string :plot
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
