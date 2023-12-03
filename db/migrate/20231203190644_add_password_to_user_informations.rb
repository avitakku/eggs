class AddPasswordToUserInformations < ActiveRecord::Migration
  def change
    add_column :user_informations, :password_digest, :string
  end
end
