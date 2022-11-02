class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string    :post_code,        null:false
      t.integer   :address_id,       null:false
      t.string    :municipalities,   null:false
      t.integer   :address_number,   null:false
      t.string    :building,         null:false
      t.string    :tel,              null:false
      t.references :consumer,        null:false,foreign_key:true
      t.timestamps
    end
  end
end
