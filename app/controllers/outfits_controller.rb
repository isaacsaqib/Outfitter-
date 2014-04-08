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
    #displays new form
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

  def all_outfits
    @oufits = Outfit.all
    #All outfits page linking to index
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
    #Explore outfits page
  end

  def outfit_search
    results = []
    response = HTTParty.get("https://api.instagram.com/v1/tags/outfit/media/recent?client_id=#{ENV['INSTAGRAM_CLIENT_ID']}")
    outfit_links = response["data"].map do |gram|
      results << [gram["images"]["low_resolution"]["url"],
      gram["likes"]["count"]]
    end
    results
  end
  #API USAGE BOY


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

# https://api.instagram.com/oauth/authorize/?client_id=d5809c177a14434cb71f0fbb80be9d84&redirect_uri=http://intense-stream-2912.herokuapp.com/
# &response_type=code

# curl \-F 'client_id=d5809c177a14434cb71f0fbb80be9d84' \
#     -F 'client_secret=4b0d530df56f4e40ae76d95287fedbec' \
#     -F 'grant_type=authorization_code' \
#     -F 'redirect_uri=http://intense-stream-2912.herokuapp.com/' \
#     -F 'code=3eb83ef10a3044dba8f7cb4d4a5b1772' \https://api.instagram.com/oauth/access_token

#     https://api.instagram.com/oauth/authorize/?client_id=d5809c177a14434cb71f0fbb80be9d84&redirect_uri=http://intense-stream-2912.herokuapp.com/&response_type=code
