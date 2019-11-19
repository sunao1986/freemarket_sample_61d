FactoryBot.define do

  factory :user do
    nickname              {"タナタロ"}
    email                 {"kkk@gmail.com"}
    password              {"abcde000"}
    password_confirmation {"abcde000"}
    first_name            {"田中"}
    last_name             {"太朗"}
    first_kana            {"タナカ"}
    last_kana             {"タロウ"}
    birthday              {"1"}
    birthyear             {"1930"}
    birthmonth            {"1"}
  end

end