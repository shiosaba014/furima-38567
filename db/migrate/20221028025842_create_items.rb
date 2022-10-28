class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                   null:false
      t.text :explan,                   null:false
      t.integer :category_id,           null:false
      t.integer :situation_id,          null:false
      t.integer :delivery_chage_id,     null:false
      t.integer :address_id,            null:false
      t.integer :period_id,             null:false
      t.integer :price,                 null:false
      t.references :user,               null:false,foreign_key:true
      t.timestamps
    end
  end
end
