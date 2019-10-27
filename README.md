# README

2019/10/27 最低限のテーブル設計 

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
|first_name|string|null: false|
|first_name|string|null: false|
|first_name|string|null: false|
|first_name|string|null: false|

### Association
- has_many :messages
- has_many :groups_users
- has_many :groups, through: :groups_users

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|message|text|
|image|string|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :messages
- has_many :groups_users
- has_many :users, through: :groups_users

## groups_usersテーブル

|Column|Type|Options|
|------|----|-------|
|group_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

