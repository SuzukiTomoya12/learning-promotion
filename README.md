# アプリ名
Stairs  

# 概要
このアプリは、日々の学習を手助けするためのアプリです。学校に通う子どもたちの宿題、就職活動のための社会勉強、社会人のスキルアップのための学習。全ての人が日々、学ばなければならない環境にあります。しかし、そのモチベーションを保つことは容易ではありません。そこで、このアプリが手助けをします。1日1回、学習後にこのアプリでレポートを作ると経験値を獲得し、レベルアップすることができます。このレベルアップの体験がユーザーのモチベーションを保ち、翌日の学習に繋がるはずです。  

## 制作背景
塾講師としてアルバイトをしていた時、ゲームをするのが好きで、勉強の方は楽しくないからしたくないと言う生徒が多くいました。その時私も共感する部分があったので、だったらゲームのような感覚を味わえれば進んで勉強したくなるのではないかと考え、1つの答えとしてアプリで勉強を手助けできるツールを開発しようと決めました。  


## 使い方
### 新規登録・ログイン
1. 初めてご利用される方は、トップページ上部のヘッダーから「新規登録」をクリックします。ログインの場合は、「ログイン」をクリックします。

<img width="1440" alt="toppage" src="https://user-images.githubusercontent.com/60733386/78122547-df88b580-7447-11ea-8d0d-3d7184fbf0ac.png">

2. 新規登録画面に遷移しますので、ユーザー名、メールアドレス、パスワードを入力の上、登録ボタンをクリックします。ログインの場合は、登録時のメールアドレスとパスワードを入力の上、ログインボタンをクリックしてください。

<img width="320" alt="新規登録画面" src="https://user-images.githubusercontent.com/60733386/78123643-72761f80-7449-11ea-92cb-b9df3adc448b.png">

3. 新規登録・ログインの完了です。

### 学習後のレポート作成
※本手順は、レポートの作成前に学習をしておく必要があります。  
1. ログイン後、トップページのヘッダーに登録したユーザー名が表示されますので、そちらからマイページに遷移します。

2. マイページの「レポートを作成する」ボタンを押します。
<img width="1414" alt="マイページ" src="https://user-images.githubusercontent.com/60733386/78124193-4d35e100-744a-11ea-8813-4c0537062432.png">

3. レポート作成画面にて記入欄を埋め、「作成」ボタンを押します。
<img width="320" alt="レポート作成画面" src="https://user-images.githubusercontent.com/60733386/78124695-01376c00-744b-11ea-879d-5329c9366009.png">

4. レポート作成の完了です。


## 使用技術
Ruby on Rails, haml, sass, JavaScript, jQuery, AWS

## バージョン
ruby 2.5.1  
Rails 5.0.7.2  

## 本番環境
[本番環境へのアクセスURL](http://18.176.92.110/)

## インストール
ターミナルで以下のコマンドを実行してください。

```
$  git clone https://github.com/SuzukiTomoya12/learning-promotion.git
```

## 製作者
鈴木 智也（Suzuki Tomoya）

## 製作者連絡先
[Twitterアカウント](https://twitter.com/tmy_szk12eng)

# DB設計
## ER図
![StairsのER図](https://user-images.githubusercontent.com/60733386/78125927-adc61d80-744c-11ea-8ebd-65bd1cdf566b.png)

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

## possessionテーブル
|Column|Type|Options|
|------|----|-------|
|report|references|null: false, foreign_key: true|
|tag|references|null: false, foreign_key: true|
### Association
- belongs_to :report
- belongs_to :tag

## registrationテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|tag|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :tag

<!-- # Description
This application helps daily learning.
For example, homework for children attending school, social study for job hunting, skill up learning for business person.
People are in an environment where they have to keep learning everyday.
But keeping motivation is not easy. So this app will help you.
After learning, make a report with this app to gain experience, you can level up.
It's experience of level up keeps your motivation and would connect the next learning.  

Please paste the following commands at a terminal prompt.

```
$  git clone https://github.com/SuzukiTomoya12/learning-promotion.git
``` -->