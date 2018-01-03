class ReviewsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]

	def index
		
	end

	def new
		  @ticket = Ticket.find(params[:ticket_id])
		  @review = Review.new

	end


		
	

	def create
		@ticket = Ticket.find(params[:ticket_id])
		@review = current_user.review.create(review_params)
		if @review.save
			redirect_to root_path
	    else
	    	render :index
	    end

		
	end
  


	
		


	def show
		@review = Review.find(params[:id])

		
	end

	def update
		@review = Review.find(params[:id])

		if @reservation.update_attributes(review_params)

		  redirect_to root_path   
		 
		 else
		 	

		 	
		 end 

	end




 


	private

	def review_params
		 params.require(:review).permit(:star, :impression, :ticket_id,:user_id)
	end
end