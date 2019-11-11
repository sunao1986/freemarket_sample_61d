class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable
    has_many :cards
    has_one :shipping
    has_many :items, dependent: :destroy
    # has_many :likes
    # has_many :comments
    # has_many :reviews

    # def self.from_omniauth(auth)
    #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    #     user.email = auth.info.email
    #     user.password = Devise.friendly_token[0,20]
    #     user.name = auth.info.name   # assuming the user model has a name
    #     user.image = auth.info.image
    #   end  
    # end    
    def self.from_omniauth(auth)
      user = User.where(email: auth.info.email).first
      if user
        return user
      else
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          # userモデルが持っているカラムをそれぞれ定義していく
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
  
          # If you are using confirmable and the provider(s) you use validate emails,
          # uncomment the line below to skip the confirmation emails.
          user.skip_confirmation!
        end
      end
    end
end
