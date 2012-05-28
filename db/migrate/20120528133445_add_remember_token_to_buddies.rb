class AddRememberTokenToBuddies < ActiveRecord::Migration
  def change
    add_column :buddies, :remember_token, :string
    add_index :buddies, :remember_token
  end
end
