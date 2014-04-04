class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
    redirect_to("/")
      else
    # render the new.html.erb file with @user
    render :new
      end
  end

  def show
    @user = User.find_by(id: params[:id])
    @outfits = @user.outfits
  end
  def vote
    # @user = User.find(params[:user_id])
    @outfit = Outfit.find(params[:id])
    @outfit.vote_count += 1
    @outfit.save
    redirect_to(user_path) #or /outfits
  end

private #only for the controller 22

  def user_params
    params.require(:user).permit(:name, :gender, :email, :style, :age, :password, :password_confirmation)
  end
end

