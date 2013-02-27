class DropProfilePicFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :profile_pic
  end

  def down
    add_column :users, :profile_pic, :binary
  end
end
