require 'rails_helper'
describe Item do
  describe '#create' do

    it "必須項目が存在すれば出品できる" do
     item = build(:item)
     item.valid?
     expect(item).to be_valid
    end

    it "nameがないと出品できない" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
     end

     it "discriptionがないと出品できない" do
      item = build(:item, discription: nil)
      item.valid?
      expect(item.errors[:discription]).to include("can't be blank")
     end

     it "statusがないと出品できない" do
      item = build(:item, status: nil)
      item.valid?
      expect(item.errors[:status]).to include("can't be blank")
     end

     it "delivery_costがないと出品できない" do
      item = build(:item, delivery_cost: nil)
      item.valid?
      expect(item.errors[:delivery_cost]).to include("can't be blank")
     end

     it "delivery_methodがないと出品できない" do
      item = build(:item, delivery_method: nil)
      item.valid?
      expect(item.errors[:delivery_method]).to include("can't be blank")
     end

     it "delivery_areaがないと出品できない" do
      item = build(:item, delivery_area: nil)
      item.valid?
      expect(item.errors[:delivery_area]).to include("can't be blank")
     end

     it "delivery_daysがないと出品できない" do
      item = build(:item, delivery_days: nil)
      item.valid?
      expect(item.errors[:delivery_days]).to include("can't be blank")
     end

     it "category_idがないと出品できない" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
     end

     it "size_idがないと出品できない" do
      item = build(:item, size_id: nil)
      item.valid?
      expect(item.errors[:size_id]).to include("can't be blank")
     end

     it "user_idがないと出品できない" do
      item = build(:item, user_id: nil)
      item.valid?
      expect(item.errors[:user_id]).to include("can't be blank")
     end

     it "nameが40文字以下なら出品できる" do
      item = build(:item, name: "aaaaaaaaaabbbbbbbbbbccccccccccddddd")
      item.valid?
      expect(item).to be_valid
    end

     it "nameが40文字以上だと出品できない" do
      item = build(:item, name: "aaaaaaaaaabbbbbbbbbbccccccccccddddddddddfffff")
      item.valid?
      expect(item.errors[:name]).to include("is too long (maximum is 40 characters)")
    end

  end
end