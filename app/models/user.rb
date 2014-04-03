class User < ActiveRecord::Base
  has_many :comments
  has_many :outfits
  has_secure_password
  validates(:name,     { :presence     => true })
  validates(:email,    { :uniqueness   => { case_sensitive: false }})
  validates(:password, { :length       => { :minimum => 8, :maximum => 16 },
                         :presence     => true,
                         :confirmation => true }) # must enter confirmation password
  validates(:gender,  { :presence => true})
  validates(:age, {:presence => true})
  validates(:style, {:presence => true})

end
