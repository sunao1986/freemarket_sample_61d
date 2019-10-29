# README
2019/10/27 最低限のテーブル設計
2019/10/29 テーブル設計の見直し

## 実装予定機能
- ユーザー新規登録,編集,削除 機能
- ログイン、ログアウト 機能
- 商品のカテゴリ別一覧表示
- 商品出品、編集、削除 機能
- 商品詳細表示
- パンくず
- 商品検索機能

## 実装予定機能(追加)
- カテゴリで検索
- ブランドで検索
- いいねボタン実装
- 評価機能実装

## ER図
[![Image from Gyazo](https://i.gyazo.com/281bee552d0e49afd17326fc61f91f23.png)](https://gyazo.com/281bee552d0e49afd17326fc61f91f23)

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false|  (deviseで自動生成)
|password|string|null: false|  (deviseで自動生成)
|first_name|string|null: false|
|last_name|string|null: false|
|first_kana|string|null: false|
|last_kana|string|null: false|
|birthday|string|null: false|
|phone_number|string|null: false, unique: true|
|introduction|text|
|postal_code|string|
|prefectures|string|
|city|string|
|address|string|
|building|string|

### Association
- has_one :card
- has_one :shipping
- has_many :items, dependent: :destroy
- has_many :likes
- has_many :items, through: :likes
- has_many :comments
- has_many :items, through: :comments
- has_many :reviews
- has_many :items, through: :reviews

### memo
出品したタイミングでitemsテーブルのカラムにseller_idにcurrent_userのidを保存すれば出品者idとして使えると考える。
(reviewのデータを引出す際に名前がややこしくなるので、user_idはseller_idにする)
購入したタイミングでitemsテーブルのカラムのbuyer_idにcurrent_userのidを保存すれば購入者user_idとして使えると考える

## cardsテーブル
|card_number|string|null: false, unique: true|
|limit_month|string|null: false|
|limit_year|string|null: false|
|security_code|string|null: false|

### Association
- has_one :user

## shippingsテーブル
|first_name|string|null: false|
|last_name|string|null: false|
|first_kana|string|null: false|
|last_kana|string|null: false|
|postal_code|string|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|adress|string|null: false|
|building|string|
|phone_number|string|

### Association
- has_one :user


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|discription|text|null: false|
|status|string|null: false|
|delivery_cost|integer|null: false|
|delivery_method|string|null: false|
|delivery_area|string|null: false|
|delivery_days|string|null: false|
|price|integer|null: false|
|likes_count|integer|null: false|
|seller_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false|
|condition|string|null: false|
|category_id|integer|null: false|
|size_id|integer|null: false|
|brand_id|integer|null: false|

### Association
- has_many :images,dependent:destroy
- has_many :likes
- has_many :users, through: :likes
- has_many :comments
- has_many :users, through: :comments
- has_many :reviews
- has_many :users, through: :reviews
- belongs_to :user
- belongs_to :category
- belongs_to :size
- belongs_to :brand

### memo
user_idは出品と同時にカラムに保存==出品者idとしても使う予定。
conditionは購入者が押したタイミングでcurrent_userのidをsaveメソッドを作って保存。売却済かどうかの判断に利用。
if params[:condition].present?とかでタイミングを操作してみる。
出品中商品:itemsテーブルのuser_idがcurrent_userと一致したレコード
出品取引中商品:itemsテーブルのuser_idがcurrent_userと一致 & buyer_idが存在するレコード
売却済商品:itemsテーブルのconditionカラムに値が入ったレコード
購入取引中商品:itemsテーブルのbuyer_idがcurrent_userと一致したレコード
購入済商品:itemsテーブルのbuyer_idがcurrent_userと一致したレコードで、conditionカラムに値が入ったレコード

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image_url|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user

## likesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item, counter_cache: :likes_count
- belongs_to :user


## reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|rate|integer|null: false|
|review|text|null: false|
|seller_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item, class_name: "Item", foreign_key: seller_id

### memo
「class_name: "Item", foreign_key: buyer_id」でitemsテーブルのbuyer_idを紐づける
レビューを書いたタイミングでcurrent_userのidをbuyer_idとして入れる。
同じタイミングでitemsテーブルのseller_idも入れる。
レビューを引っ張るときはcurrent_userがseller_idのレビューを表示する。
詳細の購入者user情報はbuyer_idから連携して取得する。

## categorysテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|

### Association
- has_many :items
- has_ancestry

## sizesテーブル

|Column|Type|Options|
|------|----|-------|
|name|integer|null: false|

### Association
- has_many :items


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|integer|null: false|

### Association
- has_many :items

