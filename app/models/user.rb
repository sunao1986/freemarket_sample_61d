class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable,omniauth_providers: [:facebook, :google_oauth2]
    has_one :card
    has_one :shipping
    has_many :items, dependent: :destroy
    has_many :sns_credentials, dependent: :destroy

    validates :nickname, presence: true
    validates :email, presence: true
    validates :password, presence: true
    validates :password_confirmation, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :first_kana, presence: true
    validates :last_kana, presence: true
    validates :birthday, presence: true

    # has_many :likes
    # has_many :comments
    # has_many :reviews

    # def self.find_oauth(auth)
    #   uid = auth.uid
    #   provider = auth.provider
    #   snscredential = SnsCredential.where(uid: uid, provider: provider).first
    #   if snscredential.present?
    #     user = User.where(id: snscredential.user_id).first
    #   else
    #     user = User.where(email: auth.info.email).first
    #     if user.present?
    #       SnsCredential.create(
    #         uid: uid,
    #         provider: provider,
    #         user_id: user.id
    #         )
    #     else
    #       user = User.create(
    #         nickname: auth.info.name,
    #         email:    auth.info.email,
    #         password: Devise.friendly_token[0, 20],
    #         telephone: "08000000000"
    #         )
    #       SnsCredential.create(
    #         uid: uid,
    #         provider: provider,
    #         user_id: user.id
    #         )
    #     end
    #   end
    #   return user
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
          # user.skip_confirmation!
        end
      end
    end
end
