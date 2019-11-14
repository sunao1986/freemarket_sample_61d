crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", users_path
  parent :root
end

# 設定------------------------------------------
crumb :profile do
  link "プロフィール", users_path
  parent :mypage
end

# crumb : do
#   link "発送・お届け先住所変更", edit_shipping_path
#   parent :mypage
# end

# crumb : do
#   link "支払い方法", edit_card_path
#   parent :mypage
# end

# crumb :meilpass do
#   link "メール/パスワード", edit_user_path
#   parent :mypage
# end

crumb :personinfo do
  link "本人情報", edit_user_path
  parent :mypage
end

# crumb : do
#   link "電話番号の確認", phone_users_path
#   parent :mypage
# end

crumb :logout do
  link "ログアウト", logout_users_path
  parent :mypage
end

# 出品・購入ステータス---------------------------------------------

crumb :listing do
  link "出品した商品-出品中", listing_users_path
  parent :mypage
end

crumb :progress do
  link "出品した商品-取引中", progress_users_path
  parent :mypage
end

crumb :completed do
  link "出品した商品-売却済み", completed_users_path
  parent :mypage
end

crumb :purchase do
  link "購入した商品-取引中", purchase_users_path
  parent :mypage
end

crumb :purchased do
  link "購入した商品-過去の取引", purchased_users_path
  parent :mypage
end









# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).