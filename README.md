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
-has_many :items
-has_many :cards


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|image|string|null: false, unique: true|
|price|integer|null: false, unique: true|
|explanation|text|null: false, unique: true|
|comment_id|integer|null: false, foreign_key: true|
|Delivery_fee|string|null: false, unique: true|
|days|string|null: false, add_index: true|
|region|string|null: false, unique: true|
|user_id|integer|null: false, unique: true|


## Association
-belongs_to :user
-has_many :items, through: :items_comments
-has_many :addresses



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
|e-mail|string|null: false, unique: true|
|nickname|string|null: false, add_index: true|
|password|string|null: false, unique: true|
|user_id|integer|null: false, unique: true|
|post_code|integer|null: false, unique: true|
|prefectures|string|null: false, add_index: true|
|municipalities|string|null: false, unique: true|

## Association
-belongs_to :item

