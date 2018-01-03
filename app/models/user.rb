class User < ApplicationRecord
	 include Gravtastic
        gravtastic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable



  
  
   has_many :ticket, dependent: :destroy
   has_many :reservation, dependent: :destroy
   has_many :review

    def self.from_omniauth(auth)
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.username = auth.info.name
    # //user.image = auth.info.image // 画像ようにつかう
    #   # assuming the user model has a name
   # assuming the user model has an image
    # If you are using confirmable and the provider(s) you use validate emails, 
    # uncomment the line below to skip the confirmation emails.
    # user.skip_confirmation!
  end
  end

end
