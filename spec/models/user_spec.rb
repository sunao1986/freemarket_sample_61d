require 'rails_helper'
describe User do
  describe '#create' do
    it "is valid with a nickname, email, password, password_confirmation, first_name, last_name, first_kana, last_kana, birthday, birthyear, birthmonth"  do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

  end
end