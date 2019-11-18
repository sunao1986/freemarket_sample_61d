require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a email" do
     user = User.new(nickname: "タナタロ", email: "", password: "abcde000", password_confirmation: "abcde000", first_name:"田中", last_name:"太郎", first_kana:"タナカ", last_kana:"タロウ", birthday:"1", birthyear:"1930", birthmonth:"1")
     user.valid?
     expect(user.errors[:email]).to include("can't be blank")
    end
  end
end