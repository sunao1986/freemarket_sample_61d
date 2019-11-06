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
  category_id:" ",
  size_id:" ",
  brand_id:" ",
)

women = Category.create(name: "レディース")

women_tops = women.children.create(name: "トップス")
women_jacket = women.children.create(name: "ジャケット/アウター")
women_bottom = women.children.create(name: "パンツ")
women_skirt = women.children.create(name: "スカート")
women_onepiece = women.children.create(name: "ワンピース")
women_shoes = women.children.create(name: "靴")
women_pajama = women.children.create(name: "ルームウェア/パジャマ")
women_leg = women.children.create(name: "レッグウェア")
women_hat = women.children.create(name: "帽子")
women_bag = women.children.create(name: "バッグ")
women_accessories = women.children.create(name: "アクセサリー")
women_haccessories = women.children.create(name: "ヘアアクセサリー")
women_small = women.children.create(name: "小物")
women_watch = women.children.create(name: "時計")
women_wig = women.children.create(name: "ウィッグ/エクステ")
women_yukata = women.children.create(name: "浴衣/水着")
women_suit = women.children.create(name: "スーツ/フォーマル/ドレス")
women_maternity = women.children.create(name: "マタニティ")
women_other = women.children.create(name: "その他")


women_tops.children.create([{name: "Tシャツ/カットソー(半袖/袖なし)"}, 
                            {name: "Tシャツ/カットソー(七分/長袖)"},
                            {name: "シャツ/ブラウス(半袖/袖なし)"},
                            {name: "シャツ/ブラウス(七分/長袖)"},
                            {name: "ポロシャツ"},
                            {name: "キャミソール"},
                            {name: "タンクトップ"},
                            {name: "ホルターネック"},
                            {name: "ニット/セーター"},
                            {name: "チュニック"},
                            {name: "カーディガン/ボレロ"},
                            {name: "アンサンブル"},
                            {name: "ベスト/ジレ"},
                            {name: "パーカー"},
                            {name: "トレーナー/スウェット"},
                            {name: "ベアトップ/チューブトップ"},
                            {name: "ジャージ"},
                            {name: "その他"}])
women_jacket.children.create([{name: "テーラードジャケット"},
                              {name: "ノーカラージャケット"},
                              {name: "Gジャン/デニムジャケット"},
                              {name: "レザージャケット"},
                              {name: "ダウンジャケット"},
                              {name: "ライダースジャケット"},
                              {name: "ミリタリージャケット"},
                              {name: "ダウンベスト"},
                              {name: "ジャンパー/ブルゾン"},
                              {name: "ロングコート"},
                              {name: "トレンチコート"},
                              {name: "ダッフルコート"},
                              {name: "ピーコート"},
                              {name: "チェスターコート"},
                              {name: "モッズコート"},
                              {name: "スタジャン"},
                              {name: "毛皮/ファーコート"},
                              {name: "スプリングコート"},
                              {name: "スカジャン"},
                              {name: "その他"}])

Size.create(
  [
    {
      id: 1,
      name: "---",
    },
    {
      id: 2,
      name: "XXS以下",
    },
    {
      id: 3,
      name: "XS(SS)",
    },
    {
      id: 4,
      name: "S",
    },
    {
      id: 5,
      name: "M",
    },
    {
      id: 6,
      name: "L",
    },
    {
      id: 7,
      name: "XL(LL)",
    },
    {
      id: 8,
      name: "2XL(3L)",
    },
    {
      id: 9,
      name: "3XL(4L)",
    },
    {
      id: 10,
      name: "4XL(5L)以上",
    },
    {
      id: 11,
      name: "FREE SIZE",
    },
  ]
)

Brand.create(
  [
    {
      id: 1,
      name: "---",
    },
    {
      id: 2,
      name: "シャネル",
    },
    {
      id: 3,
      name: "ルイヴィトン",
    },
    {
      id: 4,
      name: "シュプリーム",
    },
    {
      id: 5,
      name: "ナイキ",
    },
    {
      id: 6,
      name: "カルバン・クライン",
    },
    {
      id: 7,
      name: "コーチ",
    },
    {
      id: 8,
      name: "グッチ",
    },
    {
      id: 9,
      name: "エルメス",
    },
    {
      id: 10,
      name: "バーバリー",
    },
  ]
)



