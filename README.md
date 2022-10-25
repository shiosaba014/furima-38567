# usersテーブル
|column|type|option|
|-|:-:|-:|
|nickname|string|null:false|
|email|string|null:false|
|password|string|null:false|
|family_name|string|null:false|
|first_name|string|null:false|
|family_name_kana|string|null:false|
|first_name_kana|string|null:false|
|birth_year|integer|null:false|
|birth_month|integer|null:false|
|birth_day|integer|null:false|
## Association
- has_many :buyers
- has_many :items

# itemsテーブル
|column|type|option|
|-|:-:|-:|
|item_name|string|null:false|
|item_explan|string|null:false|
|item_category|string|null:false|
|item_situation|string|null:false|
|item_delivery_charge|string|null:false|
|item_address|string|null:false|
|item_days|string|null:false|
|item_price|integer|null:false|
|user_id|references|外部キー|

## Association
- belongs_to :user
- has_one :buyer

# buyerテーブル
|column|type|option|
|-|:-:|-:|
|buyer_post_code|integer|null:false|
|buyer_prefectures|string|null:false|
|buyer_municipalities|string|null:false|
|buyer_address_number|integer|null:false|
|buyer_building|string||
|buyer_tel|integer|null:false|
|item_id|references|外部キー|
|user_id|references|外部キー|


## Association
- belongs_to :item
- belongs_to :user