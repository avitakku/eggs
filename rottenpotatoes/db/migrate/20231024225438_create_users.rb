class CreateUserInformation < ActiveRecord::Migration
    def up
      create_table :user_information do |t|
        t.string :user_id, presence: true # random number
        t.string :username, presence: true
        t.string :name, presence: true
        t.string :contact_information, presence: true
        t.string :address
        t.float :rating
        t.string :photo_url
        t.text :friends, array: true, default: []
        t.timestamps
      end
  
      add_index :user_information, :user_id, unique: true
    end
  
    def down
      drop_table :user_information
    end
  end
  