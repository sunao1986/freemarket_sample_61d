require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a nickname" do
     user = User.new(nickname: "", email: "kkk@gmail.com", password: "abcde000", password_confirmation: "abcde000", first_name:"田中", last_name:"太郎", first_kana:"タナカ", last_kana:"タロウ")
     user.valid?
     expect(user.errors[:nickname]).to include("can't be blank")
    end
  end
end