class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :title
      t.string :director
      t.text :description
      t.integer :type
      t.string :film_path
      t.string :essay_path
      t.integer :permission

      t.timestamps null: false
    end
  end
end
