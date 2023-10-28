class CreateGoodsAndServices < ActiveRecord::Migration
    def up
      create_table :goods_and_services do |t|
        t.string :user_id, presence: true
        t.string :name, presence: true
        t.integer :type, inclusion: { in: [0, 1] }, presence: true # 0 for goods, 1 for services
        t.text :description
        t.timestamps
      end
  
      add_index :goods_and_services, :user_id
    end
  
    def down
      drop_table :goods_and_services
    end
  end
  