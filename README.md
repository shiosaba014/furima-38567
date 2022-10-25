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
- has_many :buyers
- has_many :items

# itemsテーブル
|column|type|option|
|-|:-:|-:|
|item_name|string|null:false|
|item_explan|text|null:false|
|item_category|string|null:false|
|item_situation_id|integer|null:false|
|item_delivery_charge_id|integer|null:false|
|address_id|integer|null:false|
|item_days_id|integer|null:false|
|item_price|integer|null:false|
|user|references|foreign_key:true|

# Association
- belongs_to :user
- has_one :buyer

# buyersテーブル
|column|type|option|
|-|:-:|-:|
|buyer_post_code|string|null:false|
|buyer_prefectures|string|null:false|
|buyer_municipalities|string|null:false|
|address_id|integer|null:false|
|buyer_building|string||
|buyer_tel|string|null:false|

# Association
- belongs_to :item
- belongs_to :user
- belongs_to :consumer


## consumersテーブル
|column|type|option|
|-|:-:|-:|
|user|references|foreign_key:true|
|item|references|foreign_key:true|

# Association
- has_one :buyer