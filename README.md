# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index: true|
|e-mail|string|null: false, unique: true|
|nickname|string|null: false, add_index: true|
|password|string|null: false, unique: true|
|lastname|string|null: false, add_index: true|
|firstname|string|null: false, unique: true|
|katakana_lastname|string|null: false, add_index: true|
|katakana_firstname|string|null: false, unique: true|
|residence|string|null: false, add_index: true|
|furigana_last|string|null: false, unique: true|
|furigana_first|string|null: false, unique: true|
|birthday|integer|null: false, unique: true|



### Association
-has_many :comments
-has_many :items, through: :users_items
-has_many :cards


## users_itemsテーブル
|Column|Type|Options|
|------|----|-------|
|items_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

## Association
-belongs_to :item
-belongs_to :user


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false, unique: true|
|name|string|null: false, unique: true|
|explanation|text|null: false, unique: true|
|category|string|null: false, add_index: true|
|Commodity_condition|string|null: false, unique: true|
|Shipping_charges|integer|null: false, unique: true|
|region|string|null: false, unique: true|
|Shipping_days|integer|null: false, unique: true|
|price|integer|null: false, unique: true|
|comment_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, unique: true|


## Association
-has_many :items, through: :items_comments
-has_many :addresses
-has_many :users, through: :users_items



## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|text|text|null: false, foreign_key: true|

## Association
-has_many :items, through: :items_comments
-belongs_to :user

## items_commentsテーブル

|Column|Type|Options|
|------|----|-------|
|items_id|integer|null: false, foreign_key: true|
|comments_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :comment


## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|post_code|integer|null: false, unique: true|
|prefectures|string|null: false, add_index: true|
|municipalities|string|null: false, unique: true|
|house_number|string|null: false, unique: true|
|building|string|null: false, add_index: true|
|phone_number|string|null: false, unique: true|
|user_id|integer|null: false, unique: true|

## Association
-belongs_to :item

