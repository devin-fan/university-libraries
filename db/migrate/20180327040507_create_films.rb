class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :title
      t.integer :film_type
      t.string :director
      t.string :film_path
      t.string :essay_path
      t.integer :permission
      t.text :description

      t.timestamps null: false
    end
  end
end
