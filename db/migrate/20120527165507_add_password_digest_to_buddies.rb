class AddPasswordDigestToBuddies < ActiveRecord::Migration
  def change
    add_column :buddies, :password_digest, :string

  end
end
