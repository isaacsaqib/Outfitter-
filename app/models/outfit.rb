class Outfit < ActiveRecord::Base
  has_many :comments

  has_many :votes
  belongs_to :user
  has_attached_file :photo, :styles => { :small => "300x450>" },
                    :url  => "/:attachment/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/:attachment/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/jpg', 'image/png']
  validates(:description,  { :presence => true } )
  validates(:brand_name,  { :presence => true } )
  validates(:style,  { :presence => true } )
end

# @outfit = Outfit.new(:description => "cool")
# @outfit.save

# @outfit.liked_by @user
# @outfit.votes.size
