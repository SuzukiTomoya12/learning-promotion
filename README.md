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

# learning-promotionのDB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|username|string|null: false, unique: true|
|email|string|null: false|
|password|string|null: false|
|birthday|string||
|avatar|text||
|profile|text||
|sex|string||
|level|integer||
|experience|integer||
### Asociation
- has_many :reports
- has_many :users_tags
- has_many  :tags, through: :users_tags

## reportsテーブル
|Column|Type|Options|
|------|----|-------|
|tagname|string|null: false|
|total_time_hour|integer|null: false|
|total_time_minute|integer|null: false|
|concentration_time_hour|integer|null: false|
|concentration_time_minute|integer|null: false|
|content|text||
|image|text||
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :reports_tags
- has_many  :tags, through: :reports_tags


## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
|ancestry|string||
### Association
- has_many :reports

<!-- ## users_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|tag|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :tag

## reports_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|report|references|null: false, foreign_key: true|
|tag|references|null: false, foreign_key: true|
### Association
- belongs_to :report
- belongs_to :tag

## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|tagname|string|null: false|
|parent-tag|references|null: false, foreign_key: true|
### Association
- has_many :users
- has_many :reports
- belongs_to :parent-tag

## parent-tagsテーブル
|Column|Type|Options|
|------|----|-------|
|parent-tagname|string|null: false|
### Association
- has_many :tags -->