require 'rails_helper'
describe Item do
  describe '#create' do
    it "is invalid without a name" do
     item = Item.new(id: "1", name: "", discription: "説明", status: "新品", delivery_cost: "出品者負担", delivery_method:"未定", delivery_area:"東京", delivery_days:"1日", price:"100", category_id:"100", size_id:"2", user_id:"1")
     item.valid?
     expect(item.errors[:name]).to include("can't be blank")
    end
  end
end