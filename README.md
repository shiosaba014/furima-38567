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
- has_many :consumers

# itemsテーブル
|column|type|option|
|-|:-:|-:|
|name|string|null:false|
|explan|text|null:false|
|category_id|integer|null:false|
|situation_id|integer|null:false|
|delivery_charge_id|integer|null:false|
|address_id|integer|null:false|
|period_id|integer|null:false|
|price|integer|null:false|
|user|references|foreign_key:true,null:false|

## Association
- belongs_to :user
- has_one :consumer

# buyersテーブル
|column|type|option|
|-|:-:|-:|
|post_code|string|null:false|
|address_id|integer|null:false|
|municipalities|string|null:false|
|address_number|integer|null:false|
|building|string||
|tel|string|null:false|
|consumer|references|foreign_key:true,null:false|

## Association
- belongs_to :consumer


# consumersテーブル
|column|type|option|
|-|:-:|-:|
|user|references|foreign_key:true,null:false|
|item|references|foreign_key:true,null:false|

## Association
- belongs_to :user
- belongs_to :item
- has_one :buyer