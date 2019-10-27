# README
2019/10/27 最低限のテーブル設計

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
- ブランドでで検索
- いいねボタン実装
- 評価機能実装

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false|  (deviseで自動)
|password|string|null: false|  (deviseで自動)
|first_name|string|null: false|
|last_name|string|null: false|
|first_kana|string|null: false|
|last_kana|string|null: false|
|birthday|string|null: false|
|phone_number|string|null: false, unique: true|
|introduction|text|
|postal_code|string|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|adress|string|null: false|
|building|string|
***以下は基本的に非保持データのため処理を検討する***
|card_number|string|null: false, unique: true|
|limit_month|string|null: false|
|limit_year|string|null: false|
|security_code|string|null: false|

### Association
- has_many :items,dependent:destroy
- has_many :coments,dependent:destroy
***transactionsテーブル作成時(検証中)***
- has_many :buyer_transactions, class_name: 'transactions', foreign_key: :buyer_id, dependent: :destroy
- has_many :seller_transactions, class_name: 'transactions', foreign_key: :seller_id, dependent: :destroy
***reviewsテーブル作成時(購入者と出品者をどう処理するか未定)***
- has_many :reviews, dependent: :destroy
***likessテーブル作成時***
- has_many :likes
- has_many :items, through: :likes

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|discription|text|null: false|
|status|string|null: false|
|delivery_cost|integer|null: false|
|delivery_method|string|null: false|
|delivery_days|string|null: false|
|price|integer|null: false|
***likessテーブル作成時***
|likes_count|integer|null: false|
***以下は追加で実装するカラム***
|category_first_id|integer|null: false|
|category_second_id|integer|null: false|
|category_third_id|integer|null: false|
|size_id|integer|null: false|
|brand_id|integer|null: false|
(カテゴリーやサイズ、ブランドは別テーブル設計)

### Association
- has_many :images,dependent:destroy
- has_many :coments,dependent:destroy
***likessテーブル作成時***
- has_many :likes
- has_many :users, through: :likes
***以下は追加で実装するアソシエーション***
- belongs_to :category_first
- belongs_to :category_second
- belongs_to :category_third
- belongs_to :size
- belongs_to :brand
***transactionsテーブル作成時(検証中)***
- has_many :buyer_transactions, class_name: 'transactions', foreign_key: :buyer_id, dependent: :destroy
- has_many :seller_transactions, class_name: 'transactions', foreign_key: :seller_id, dependent: :destroy
- has_many :seller, class_name: 'User', foreign_key: :seller_id, through: :transactions
- has_many :buyer, class_name: 'User', foreign_key: :buyer_id, through: :transactions

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image_url|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item

## comentsテーブル

|Column|Type|Options|
|------|----|-------|
|coment|text|null: false|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user


***ここから先は追加機能実装の時に必要になるであろうテーブル***

## likesテーブル(中間)

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user


## reviewsテーブル(購入者と出品者をどう処理するか未定)

|Column|Type|Options|
|------|----|-------|
|rate|integer|null: false|
|review|text|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

## transactionsテーブル(検証中)

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|bayer_id|integer|null: false, foreign_key: true|
|saller_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :seller, class_name: 'User', foreign_key: :seller_id
- belongs_to :buyer, class_name: 'User', foreign_key: :buyer_id

## categorys_firstテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items
- has_many :cotegories_second

## categorys_secondテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|cotegory_first_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :cotegories_first
- has_many :items
- has_many :cotegories_third

## categorys_thirdテーブル

|Column|Type|Options|
|------|----|-------|
|name|integer|null: false|
|cotegory_second_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :cotegories_second
- has_many :items
- has_many :sizes

## sizesテーブル

|Column|Type|Options|
|------|----|-------|
|name|integer|null: false|
|cotegory_third_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :cotegory_third
- has_many :items

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|integer|null: false|

### Association
- has_many :items

