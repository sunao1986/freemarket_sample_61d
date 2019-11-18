class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable,omniauth_providers: [:facebook, :google_oauth2]
    has_one :card
    has_one :shipping
    has_many :items, dependent: :destroy
    has_many :sns_credentials, dependent: :destroy
    has_many :comments

    def self.from_omniauth(auth)
      user = User.where(email: auth.info.email).first
      if user
        return user
      else
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.email = auth.info.email
          user.password = Devise.friendly_token[0,20]
          user.nickname = auth.info.nickname
          user.first_name = auth.info.first_name
          user.last_name = auth.info.last_name
          user.first_kana = auth.info.first_kana
          user.last_kana = auth.info.last_kana
          user.birthday = auth.info.birthday
          user.uid = auth.uid
          user.provider = auth.provider
        end
      end
    end
end
