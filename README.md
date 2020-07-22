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
|residence|string|null: false, add_index: true|

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


## Association
-belongs_to :user
-has_many :items, through: :items_comments


## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|number|string|null: false, unique: true|
|residence|string|null: false, unique: true|
|security_code|integer|null: false, unique: true|
|deadline|integer|null: false, unique: true|

## Association
-belongs_to :user


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