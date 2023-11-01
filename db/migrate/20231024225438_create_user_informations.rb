class CreateUserInformations < ActiveRecord::Migration
    def up
      create_table :user_informations do |t|
        t.string :user_id
        t.string :username
        t.string :name
        t.string :contact_information
        t.string :address
        t.float :rating
        t.string :photo_url
        t.text :friends, array: true, default: []
        t.timestamps
      end
  
      add_index :user_informations, :user_id, unique: true
    end
  
    def down
      drop_table :user_informations
    end
  end
  