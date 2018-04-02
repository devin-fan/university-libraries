class AddFilmTagIDs < ActiveRecord::Migration
  def change
    add_column :film_tags, :film_id, :int
    add_column :film_tags, :tag_id, :int
  end
end
