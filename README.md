# テーブル設計

## users テーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_data|date|null: false|

### Association

- has_many :items
- has_many :purchases

## items テーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|explanation|text|null: false|
|category|string|null: false|
|condition|string|null: false|
|postage|string|null: false|
|area|string|null: false|
|days|string|null: false|
|price|integer|null: false|
|user|references|null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :purchas

## purchases テーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|state|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|
|phone|integer|null: false|
|purchas|references|null: false, foreign_key: true|

### Association

- belongs_to :purchas
