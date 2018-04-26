class AddAndrewidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :andrewid, :string
  end
end
