class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :outfit
  validates(:text_section, { :presence => true } )
end
