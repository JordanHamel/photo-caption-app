class AddPhotoToUsers < ActiveRecord::Migration
  # REV: more tabs!
  def change
  	add_column :users, :profile_pic, :binary
  end
end
