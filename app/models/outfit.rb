class Outfit < ActiveRecord::Base
  has_many :comments
  has_many :votes
  belongs_to :user
  has_attached_file :photo, :styles => { :small => "300x450>" },
                    :url  => "/assets/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension",
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/jpg', 'image/png']
  validates(:description,  { :presence => true } )
  validates(:brand_name,  { :presence => true } )
  validates(:style,  { :presence => true } )

  def s3_credentials
    {:bucket => "Outfitter", :access_key_id => "AKIAIL22AKTKC4BBHAZA", :secret_access_key => "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"}
  end
end

# @outfit = Outfit.new(:description => "cool")
# @outfit.save

# @outfit.liked_by @user
# @outfit.votes.size
