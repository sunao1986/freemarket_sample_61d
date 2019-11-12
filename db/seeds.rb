# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

women = Category.create(name: "レディース")
mens = Category.create(name: "メンズ")
kids = Category.create(name: "ベビー・キッズ")
interior = Category.create(name: "インテリア・住まい・小物")
book = Category.create(name: "本・音楽・ゲーム")
toy = Category.create(name: "おもちゃ・ホビー・グッズ")
beauty = Category.create(name: "コスメ・香水・美容")
appliance = Category.create(name: "家電・スマホ・カメラ")
sports = Category.create(name: "スポーツ・レジャー")
handmade = Category.create(name: "ハンドメイド")
ticket = Category.create(name: "チケット")
bike = Category.create(name: "自転車・オートバイ")
other = Category.create(name: "その他")

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

mens_tops = mens.children.create(name: "トップス")
mens_jacket = mens.children.create(name: "ジャケット/アウター")
mens_bottom = mens.children.create(name: "パンツ")
mens_shoes = mens.children.create(name: "靴")
mens_bag = mens.children.create(name: "バッグ")
mens_suit = mens.children.create(name: "スーツ")
mens_hat = mens.children.create(name: "帽子")
mens_accessories = mens.children.create(name: "アクセサリー")
mens_small = mens.children.create(name: "小物")
mens_watch = mens.children.create(name: "時計")
mens_water = mens.children.create(name: "水着")
mens_leg = mens.children.create(name: "レッグウェア")
mens_under = mens.children.create(name: "アンダーウェア")
mens_other = mens.children.create(name: "その他")

kids_size1 = kids.children.create(name: "ベビー服(女の子用) ~95cm")
kids_size2 = kids.children.create(name: "ベビー服(男の子用) ~95cm")
kids_size3 = kids.children.create(name: "ベビー服(男女兼用) ~95cm")
kids_size4 = kids.children.create(name: "キッズ服(女の子用) 100cm~")
kids_size5 = kids.children.create(name: "キッズ服(男の子用) 100cm~")
kids_size6 = kids.children.create(name: "キッズ服(男女兼用) 100cm~")
kids_shoes = kids.children.create(name: "キッズ靴")
kids_small = kids.children.create(name: "子供用ファッション小物")

interior_kitchen = interior.children.create(name: "キッチン/食器")
interior_bed = interior.children.create(name: "ベッド/マットレス")

book_book = book.children.create(name: "本")
book_manga = book.children.create(name: "漫画")

toy_toy = toy.children.create(name: "おもちゃ")
toy_talent = toy.children.create(name: "タレントグッズ")

beauty_base = beauty.children.create(name: "ベースメイク")
beauty_make = beauty.children.create(name: "メイクアップ")

appliance_smart = appliance.children.create(name: "スマートフォン/携帯電話")
appliance_phoneitem = appliance.children.create(name: "スマホアクセサリー")

sports_golf = sports.children.create(name: "ゴルフ")
sports_fish = sports.children.create(name: "フィッシング")

handmade_accessories = handmade.children.create(name: "アクセサリー(女性用)")
handmade_small = handmade.children.create(name: "ファッション/小物")

ticket_music = ticket.children.create(name: "音楽")
ticket_sports = ticket.children.create(name: "スポーツ")

bike_body = bike.children.create(name: "自転車本体")
bike_tire = bike.children.create(name: "自転車タイヤ/ホイール")

other_food = other.children.create(name: "まとめ売り")
other_pet = other.children.create(name: "ペット用品")

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
women_bottom.children.create([{name: "デニム/ジーンズ"},
                              {name: "ショートパンツ"},
                              {name: "カジュアルパンツ"},
                              {name: "ハーフパンツ"}])
women_skirt.children.create([{name: "ミニスカート"},
                              {name: "ひざ丈スカート"},
                              {name: "ロングスカート"},
                              {name: "キュロット"}])
women_onepiece.children.create([{name: "ミニワンピース"},
                              {name: "ひざ丈ワンピース"},
                              {name: "ロングワンピース"},
                              {name: "その他"}])
women_shoes.children.create([{name: "ハイヒール/パンプス"},
                              {name: "ブーツ"},
                              {name: "サンダル"},
                              {name: "スニーカー"}])
women_pajama.children.create([{name: "パジャマ"},
                              {name: "ルームウェア"}])
women_leg.children.create([{name: "ソックス"},
                              {name: "スパッツ/レギンス"},
                              {name: "ストッキング/タイツ"},
                              {name: "レッグウオーマー"}])
women_hat.children.create([{name: "ニットキャップ/ビーニー"},
                              {name: "ハット"},
                              {name: "ハンチング/ベレー帽"},
                              {name: "キャップ"}])
women_bag.children.create([{name: "ハンドバッグ"},
                              {name: "トートバッグ"},
                              {name: "エコバッグ"},
                              {name: "リュック/バックパック"}])
women_accessories.children.create([{name: "ネックレス"},
                              {name: "ブレスレット"},
                              {name: "バングル/リストバンド"},
                              {name: "リング"}])
women_haccessories.children.create([{name: "ヘアゴム/シュシュ"},
                              {name: "ヘアバンド/カチューシャ"},
                              {name: "ヘアピン"},
                              {name: "その他"}])
women_small.children.create([{name: "長財布"},
                              {name: "折り財布"},
                              {name: "コインケース/小銭入れ"},
                              {name: "名刺入れ/定期入れ"}])
women_watch.children.create([{name: "腕時計(アナログ)"},
                              {name: "腕時計(デジタル)"},
                              {name: "ラバーベルト"},
                              {name: "レザーベルト"}])
women_wig.children.create([{name: "前髪ウィッグ"},
                              {name: "ロングストレート"},
                              {name: "ロングカール"},
                            {name: "ショートストレート"}])
women_yukata.children.create([{name: "浴衣"},
                              {name: "着物"},
                              {name: "振袖"},
                              {name: "水着"}])
women_suit.children.create([{name: "スカートスーツ上下"},
                              {name: "パンツスーツ上下"},
                              {name: "ドレス"},
                              {name: "パーティバッグ"}])
women_maternity.children.create([{name: "トップス"},
                              {name: "アウター"},
                              {name: "インナー"},
                              {name: "ワンピース"}])
women_other.children.create([{name: "トップス"},
                              {name: "コスプレ"},
                              {name: "下着"},
                              {name: "その他"}])

mens_tops.children.create([{name: "Tシャツ/カットソー(半袖/袖なし)"},
                            {name: "Tシャツ/カットソー(七分/長袖)"},
                            {name: "シャツ"},                     
                            {name: "ポロシャツ"},                   
                            {name: "タンクトップ"},                 
                            {name: "ニット/セーター"},            
                            {name: "パーカー"},
                            {name: "カーディガン"},
                            {name: "スウェット"},
                            {name: "ジャージ"},
                            {name: "ベスト"},
                            {name: "その他"}])
mens_jacket.children.create([{name: "テーラードジャケット"},
                              {name: "ノーカラージャケット"},
                              {name: "Gジャン/デニムジャケット"},
                              {name: "レザージャケット"},
                              {name: "ダウンジャケット"},
                              {name: "ライダースジャケット"},
                              {name: "ミリタリージャケット"},
                              {name: "ナイロンジャケット"},
                              {name: "フライトジャケット"},
                              {name: "ダッフルコート"},
                              {name: "ピーコート"},
                              {name: "ステンカラーコート"},
                              {name: "トレンチコート"},
                              {name: "モッズコート"},
                              {name: "チェスターコート"},
                              {name: "スタジャン"},
                              {name: "スカジャン"},
                              {name: "ブルゾン"},
                              {name: "マウンテンパーカ-"},
                              {name: "ポンチョ"},
                              {name: "ダウンベスト"},
                              {name: "カバーオール"},
                              {name: "その他"}])
mens_bottom.children.create([{name: "デニム/ジーンズ"},
                              {name: "ワークパンツ"},
                              {name: "スラックス"},
                              {name: "チノパン"}])
mens_shoes.children.create([{name: "スニーカー"},
                              {name: "サンダル"},
                              {name: "ブーツ"},
                              {name: "モカシン"}])
mens_bag.children.create([{name: "ショルダーバッグ"},
                              {name: "トートバッグ"},
                              {name: "ボストンバッグ"},
                              {name: "リュック/バックパック"}])
mens_suit.children.create([{name: "スーツジャケット"},
                              {name: "スーツベスト"},
                              {name: "スラックス"},
                              {name: "セットアップ"}])
mens_hat.children.create([{name: "キャップ"},
                              {name: "ハット"},
                              {name: "ニットキャップ/ビーニー"},
                              {name: "ハンチング/ベレー帽"}])
mens_accessories.children.create([{name: "ネックレス"},
                              {name: "ブレスレット"},
                              {name: "バングル/リストバンド"},
                              {name: "リング"}])
women_small.children.create([{name: "長財布"},
                              {name: "折り財布"},
                              {name: "マネークリップ"},
                              {name: "コインケース/小銭入れ"}])
mens_watch.children.create([{name: "腕時計(アナログ)"},
                              {name: "腕時計(デジタル)"},
                              {name: "ラバーベルト"},
                              {name: "レザーベルト"}])
mens_water.children.create([{name: "一般水着"},
                              {name: "スポーツ用"},
                              {name: "アクセサリー"},
                              {name: "その他"}])
mens_leg.children.create([{name: "ソックス"},
                              {name: "スパッツ/レギンス"},
                              {name: "レッグウオーマー"}])
mens_under.children.create([{name: "トランクス"},
                              {name: "ボクサーパンツ"},
                              {name: "その他"}])
mens_other.children.create([{name: "トップス"},
                                {name: "コスプレ"},
                                {name: "その他"}])

kids_size1.children.create([{name: "トップス"},
                                {name: "アウター"},
                                {name: "パンツ"}])
kids_size2.children.create([{name: "トップス"},
                                {name: "アウター"},
                                {name: "パンツ"}])
kids_size3.children.create([{name: "トップス"},
                                {name: "アウター"},
                                {name: "パンツ"}])
kids_size4.children.create([{name: "コート"},
                                {name: "ジャケット/上着"},
                                {name: "トップス(Tシャツ/カットソー)"}])
kids_size5.children.create([{name: "コート"},
                                {name: "ジャケット/上着"},
                                {name: "トップス(Tシャツ/カットソー)"}])
kids_size6.children.create([{name: "コート"},
                                {name: "ジャケット/上着"},
                                {name: "トップス(Tシャツ/カットソー)"}])
kids_shoes.children.create([{name: "スニーカー"},
                                {name: "サンダル"},
                                {name: "ブーツ"}])
kids_small.children.create([{name: "靴下/スパッツ"},
                                {name: "帽子"},
                                {name: "エプロン"}])

interior_kitchen.children.create([{name: "食器"},
                                  {name: "調理器具"},
                                  {name: "収納/キッチン雑貨"}])
interior_bed.children.create([{name: "セミシングルベッド"},
                                  {name: "シングルベッド"},
                                  {name: "ダブルベッド"}])

book_book.children.create([{name: "文学/小説"},
                            {name: "人文/社会"},
                            {name: "ノンフィクション/教養"}]) 
book_manga .children.create([{name: "全巻セット"},
                            {name: "少年漫画"},
                            {name: "少女漫画"}])

toy_toy.children.create([{name: "キャラクターグッズ"},
                            {name: "ぬいぐるみ"},
                            {name: "小物/アクセサリー"}]) 
toy_talent.children.create([{name: "アイドル"},
                            {name: "ミュージシャン"},
                            {name: "タレント/お笑い芸人"}]) 

beauty_base.children.create([{name: "ファンデーション"},
                             {name: "化粧下地"},
                             {name: "コントロールカラー"}]) 
beauty_make.children.create([{name: "アイシャドウ"},
                              {name: "口紅"},
                              {name: "リップグロス"}]) 

appliance_smart.children.create([{name: "スマートフォン本体"},
                                  {name: "バッテリー/充電器"},
                                  {name: "携帯電話本体"}]) 
appliance_phoneitem.children.create([{name: "Android用ケース"},
                                    {name: "iPhone用ケース"},
                                    {name: "カバー"}]) 

sports_golf.children.create([{name: "クラブ"},
                              {name: "ウェア(男性用)"},
                              {name: "ウェア(女性用)"}]) 
sports_fish.children.create([{name: "ロッド"},
                              {name: "リール"},
                              {name: "ルアー用品"}]) 

handmade_accessories.children.create([{name: "ピアス"},
                                {name: "イヤリング"},
                                {name: "ネックレス"}]) 
handmade_small.children.create([{name: "バッグ(女性用)"},
                                {name: "バッグ(男性用)"},
                                {name: "その他"}]) 

ticket_music.children.create([{name: "男性アイドル"},
                              {name: "女性アイドル"},
                              {name: "韓流"}]) 
ticket_sports.children.create([{name: "サッカー"},
                              {name: "野球"},
                              {name: "テニス"}]) 

bike_body.children.create([{name: "国内自転車本体"},
                          {name: "外国自転車本体"}]) 
bike_tire.children.create([{name: "タイヤ/ホイールセット"},
                            {name: "タイヤ"},
                            {name: "ホイール"}]) 

other_food.children.create([{name: "菓子"},
  {name: "米"},
  {name: "野菜"}])
other_pet.children.create([{name: "ペットフード"},
  {name: "犬用品"},
  {name: "猫用品"}]) 

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
