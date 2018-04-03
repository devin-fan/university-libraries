class AddBaseFilmPathToFilms < ActiveRecord::Migration
  def change
    add_column :films, :base_film_path, :string
  end
end
