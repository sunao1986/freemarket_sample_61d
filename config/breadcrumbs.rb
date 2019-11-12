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





# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).