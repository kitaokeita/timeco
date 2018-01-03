class TicketsController < ApplicationController

	def index
		
		@ticket = Ticket.all
	end

	def new
		
	end

	def create
		 @ticket = current_user.ticket.build(ticket_params)
		  @ticket.save
		  redirect_to  home_show_path
	end

	def show
		@ticket = Ticket.find(params[:id])
		@review = Review.all
		
     
    end

    def destroy
    	@ticket = Ticket.find(params[:id])
    	@ticket.destroy
    	 flash[:success] = "削除しました"

    	redirect_to new_ticket_path
    end



	private

	def ticket_params
		 params.require(:ticket).permit(:title,:content,:timeuse,:price,:area,:sort)
	end




end
