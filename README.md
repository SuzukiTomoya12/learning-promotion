# README
## Title
Stairs

## Description
This application helps daily learning.
For example, homework for children attending school, social study for job hunting, skill up learning for business person.
People are in an environment where they have to keep learning everyday.
But keeping motivation is not easy. So this app will help you.
After learning, make a report with this app to gain experience, you can level up.
It's experience of level up keeps your motivation and would connect the next learning.

このアプリは、日々の学習を手助けするためのアプリです。  
学校に通う子どもたちの宿題、就職活動のための社会勉強、社会人のスキルアップのための学習。全ての人が日々、学ばなければならない環境にあります。  
しかし、そのモチベーションを保つことは容易ではありません。  
そこで、このアプリが手助けをします。  
1日1回、学習後にこのアプリでレポートを作ると経験値を獲得し、レベルアップすることができます。  
このレベルアップの体験がユーザーのモチベーションを保ち、翌日の学習に繋がるはずです。

## Production background
### 制作背景
塾講師としてアルバイトをしていた時、ゲームをするのが好きで、勉強の方は楽しくないからしたくないと言う生徒が多くいました。その時私も共感する部分があったので、だったらゲームのような感覚を味わえれば進んで勉強したくなるのではないかと考え、1つの答えとしてアプリで勉強を手助けできるツールを開発しようと決めました。

## Technology used
### 使用技術
Ruby on Rails, haml, sass, JavaScript, jQuery, AWS

## Production environment
[本番環境へのアクセスURL](http://18.176.92.110/)

## Installation
Please paste the following commands at a terminal prompt.

```
$  git clone https://github.com/SuzukiTomoya12/learning-promotion.git
```
## Usage



## Ruby version
ruby 2.5.1
Rails 5.0.7.2


## Author
#### Suzuki Tomoya 鈴木智也


# DB設計
## ER図
![StairsのER図](#)

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|username|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|avatar|text||
|level|integer|null: false|
|experience|integer|null: false|
|coin|integer|null: false|
|profile|text||
|birthday|string||
|sex|string||
|bachground|integer||

### Asociation
- has_many :reports
- has_many :users_tags
- has_many  :tags, through: :users_tags

## reportsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text||
|image|text||
|total_time_hour|integer|null: false|
|total_time_minute|integer|null: false|
|concentration_time_hour|integer|null: false|
|concentration_time_minute|integer|null: false|
|total_time|float||
|concentration_time|float||
|concentration_rate|float||
|user|references|null: false, foreign_key: true|
|tag|references|null: false, foreign_key: true|

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
- has_many :reports_tags
- has_many  :reports, through: :reports_tags
- has_many :users_tags
- has_many  :users, through: :users_tags

## reports_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|report|references|null: false, foreign_key: true|
|tag|references|null: false, foreign_key: true|
### Association
- belongs_to :report
- belongs_to :tag

## users_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|tag|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :tag

