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
   has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
   has_many :followings, through: :following_relationships
   has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
   has_many :followers, through: :follower_relationships




   def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end

  def feed
   following_ids = "SELECT following_id FROM relationships
                     WHERE follower_id = :user_id"
    Ticket.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
  end

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

  def connected?
    !stripe_user_id.nil?
  end

end
