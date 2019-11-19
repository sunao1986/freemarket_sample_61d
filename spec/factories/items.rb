FactoryBot.define do

  factory :item do
    name              {"セーター"}
    discription       {"説明"}
    status            {"新品"}
    delivery_cost     {"出品者負担"}
    delivery_method   {"未定"}
    delivery_area     {"東京"}
    delivery_days     {"1日"}
    price             {"1000"}
    user_id           {"1"}
    size_id           {"1"}
    category_id       {"3000"}
  end

end