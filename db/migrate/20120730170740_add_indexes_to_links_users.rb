class AddIndexesToLinksUsers < ActiveRecord::Migration
  def change
    add_index :links_users, :link_id
    add_index :links_users, :user_id
    add_index :links_users, [:user_id, :link_id], unique: true
  end
end
