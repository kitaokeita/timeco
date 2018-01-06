class ReservationsController < ApplicationController

	def index
	 
	end

	def create
	 	@reservation = current_user.reservation.create(reservation_params)

	 	if @reservation.save
	 	flash[:success] = "予約ができました"

	 	redirect_to home_show_path 

	   else
	   	

	   end


	 end


	def show
		@reservation = Reservation.find(params[:id])
		@latitude = @reservation.latitude

    @longitude = @reservation.longitude

    @address = @reservation.address
		
		
	end

	def update
		@reservation = Reservation.find(params[:id])

		if @reservation.update_attributes(reservation_params)

		  redirect_to root_path   
		 
		 else
		 	

		 	
		 end 

	end





	def new
		
	end

	
    
   

     



	private

	def reservation_params
		 params.require(:reservation).permit(:startdate,:enddate,:ticket_id, :approval,:address,:latitude,:longitude, :user_id)
	end
end