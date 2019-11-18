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

crumb :shippingedit do
  link "発送・お届け先住所変更", edit_shipping_path
  parent :mypage
end

crumb :cards do
  link "支払い方法", cards_path
  parent :mypage
end

crumb :meilpass do
  link "メール/パスワード", edit_user_registration_path
  parent :mypage
end

crumb :personinfo do
  link "本人情報", edit_user_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_users_path
  parent :mypage
end

# 出品・購入ステータス---------------------------------------------

crumb :listing do
  link "出品中の商品", listing_users_path
  parent :mypage
end


crumb :completed do
  link "売却済みの商品", completed_users_path
  parent :mypage
end


crumb :purchased do
  link "購入商品履歴", purchased_users_path
  parent :mypage
end









# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).