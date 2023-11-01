class CreateGoodsAndServices < ActiveRecord::Migration
    def up
      create_table :goods_and_services do |t|
        t.string :user_id
        t.string :name
        t.integer :category # Renamed from 'type' to 'category'
        t.text :description
        t.timestamps
      end
  
      add_index :goods_and_services, :user_id
    end
  
    def down
      drop_table :goods_and_services
    end
  end
  