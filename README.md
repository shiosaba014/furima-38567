# usersテーブル
|column|type|option|
|-|:-:|-:|
|nickname|string|null:false|
|email|string|null:false,unique:true|
|encrypted_password|string|null:false|
|family_name|string|null:false|
|first_name|string|null:false|
|family_name_kana|string|null:false|
|first_name_kana|string|null:false|
|birth|date|null:false|
## Association
- has_many :items
- has_one :consumer

# itemsテーブル
|column|type|option|
|-|:-:|-:|
|item_name|string|null:false|
|item_explan|text|null:false|
|item_category_id|integer|null:false|
|item_situation_id|integer|null:false|
|item_delivery_charge_id|integer|null:false|
|address_id|integer|null:false|
|item_day_id|integer|null:false|
|item_price|integer|null:false|
|user|references|foreign_key:true|

## Association
- belongs_to :user
- has_one :consumer

# buyersテーブル
|column|type|option|
|-|:-:|-:|
|buyer_post_code|string|null:false|
|address_id|integer|null:false|
|buyer_municipalities|string|null:false|
|buyer_address_number|integer|null:false|
|buyer_building|string||
|buyer_tel|string|null:false|
|consumer|references|foreign_key:true|

## Association
- belongs_to :consumer


# consumersテーブル
|column|type|option|
|-|:-:|-:|
|user|references|foreign_key:true|
|item|references|foreign_key:true|

## Association
- belongs_to :user
- belongs_to :item
- has_one :buyer