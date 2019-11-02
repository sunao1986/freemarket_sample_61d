# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

User.create!(
  id: 1,
  email: "a@a",
  password: "aaaaaa",
  nickname: "テスト",
)

Item.create!(
  id: 1,
  name: "シャツ",
  discription: "新品未使用です。",
  status: "新品",
  delivery_cost: 500,
  delivery_method: "ゆうゆうパック",
  delivery_area: "北海道",
  delivery_days: "1~2日で発送",
  price: 500,
  likes_count: 1,
  buyer_id: 1,
  condition: "1",
)