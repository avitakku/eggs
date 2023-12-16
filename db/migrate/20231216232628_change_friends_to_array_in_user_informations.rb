class ChangeFriendsToArrayInUserInformations < ActiveRecord::Migration
  def up
    change_column :user_informations, :friends, :string, array: true, default: []
  end

  def down
    change_column :user_informations, :friends, :text, default: "--- []\n"
  end
end
