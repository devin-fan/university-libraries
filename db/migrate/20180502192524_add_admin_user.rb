class AddAdminUser < ActiveRecord::Migration
  def up
    admin = User.new
    admin.first_name = "Jeff"
    admin.last_name = "Hinkelman"
    admin.andrewid = "jh51"
    admin.password = "micheaux"
    admin.password_confirmation = "micheaux"
    admin.role = "admin"
    admin.save
  end
  def down
    admin = User.find_by_andrewid "jh51"
    User.delete admin
  end
end
