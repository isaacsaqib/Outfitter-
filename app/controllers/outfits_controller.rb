class OutfitsController < ApplicationController

  def index
    @user = current_user
    @outfits = Outfit.all.order(:created_at)
    # @likes = likes
    # @outfit = Outfit.new
  end

  def new
    @outfits = Outfit.all
    @outfit = Outfit.new
    @user = current_user
  end

  def create
    @outfits = Outfit.all
    @user = current_user
    @outfit = Outfit.new(outfit_params)

      if @outfit.save
        redirect_to("/")
      else
        # render the new.html.erb file with @user
        render :new
      end
  end

  def show
    @outfits = Outfit.where(user_id: current_user.id)
  end

  def all_outfits
    @oufits = Outfit.all
  end

  def vote
    # @user = User.find(params[:user_id])
    @outfit = Outfit.find(params[:id])
    @outfit.vote_count += 1
    @outfit.save
    redirect_to(outfits_path) #or /outfits
  end

  def random
    @instagram_outfits = outfit_search
  end

  def outfit_search
    response = HTTParty.get("https://api.instagram.com/v1/tags/ootd/media/recent?client_id=#{ENV['INSTAGRAM_CLIENT_ID']}")
    outfit_links = response["data"].map do |image|
      image["images"]["low_resolution"]["url"]
    end

  end



  # def likes
  #   response = HTTParty.get("https://api.instagram.com/v1/tags/ootd/media/recent?client_id=#{ENV['INSTAGRAM_CLIENT_ID']}")
  #   likes = response["data"].map do |like|
  #       like["likes"]["count"]
  #   end
  # end

  private

  def outfit_params
    params.require(:outfit).permit(
      :description,
      :style,
      :brand_name,
      :user_id,
      :photo
      )
  end
end

