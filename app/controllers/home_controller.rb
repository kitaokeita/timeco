class HomeController < ApplicationController
	before_action :authenticate_user!, only: :show
  def index
  end

  def show
  	@ticket = Ticket.where.not(user_id: current_user).order("RANDOM()").limit(6)
  end
end
