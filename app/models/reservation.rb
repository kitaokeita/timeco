class Reservation < ApplicationRecord

 belongs_to :user
 belongs_to :ticket

 geocoded_by :address
 after_validation :geocode
	
end
