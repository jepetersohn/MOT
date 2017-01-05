class AddUrlAndImgToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :url, :string
    add_column :movies, :img, :string, default: "http://hdimagesnew.com/wp-content/uploads/2016/09/image-not-found.jpg"
  end
end
