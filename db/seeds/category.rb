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
