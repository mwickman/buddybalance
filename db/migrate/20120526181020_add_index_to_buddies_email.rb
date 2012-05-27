class AddIndexToBuddiesEmail < ActiveRecord::Migration
  def change
    add_index :buddies, :email, :unique => true
  end
end
