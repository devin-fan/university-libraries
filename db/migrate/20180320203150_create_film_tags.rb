class CreateFilmTags < ActiveRecord::Migration
  def change
    create_table :film_tags do |t|

      t.timestamps null: false
    end
  end
end
