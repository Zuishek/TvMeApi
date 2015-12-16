class AddUsersToPost < ActiveRecord::Migration
  def change
    add_column :posts, :username, :string
    add_column :posts, :email, :string
  end
end
