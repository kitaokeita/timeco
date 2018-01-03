class User < ApplicationRecord
	 include Gravtastic
        gravtastic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  
  
   has_many :ticket, dependent: :destroy
   has_many :reservation, dependent: :destroy
   has_many :review
end
