class AddColsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :profile_pic, :binary
  	add_column :users, :name, :string
  end
end
