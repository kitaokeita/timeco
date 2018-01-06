class Ticket < ApplicationRecord
  belongs_to :user
  has_many :reservation, dependent: :destroy
  has_many :review, dependent: :destroy

  validates :user_id, presence: true
   
end

