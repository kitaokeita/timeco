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

  def following
      @user  = User.find(params[:id])
      @users = @user.followings
      render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end




  



end
