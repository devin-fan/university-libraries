class AddImagePathToFilms < ActiveRecord::Migration
  def change
    add_column :films, :image_path, :string
  end
end
