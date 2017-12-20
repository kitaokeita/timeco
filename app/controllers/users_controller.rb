class UsersController < ApplicationController
  def index
  	 @users = User.all
  end

  def show
  	@user = User.find(params[:id])
  	@ticket = @user.ticket.all
  end

  def useside
    @user = User.find(params[:id])
  	@reservation = current_user.reservation.all
  end

  def lend
    @user = User.find(params[:id])
    @ticket = current_user.ticket.all
  end




  



end
