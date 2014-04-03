require "spec_helper"

describe User do
  it { should have_many(:outfits) }


  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:gender) }
  it { should validate_presence_of(:style) }
  it { should validate_presence_of(:age) }
  it { should have_secure_password }
  it { should validate_confirmation_of(:password) }
  it { should ensure_length_of(:password).is_at_least(8).is_at_most(16) }

  # There's a bug in shoulda-matchers
  # https://github.com/thoughtbot/shoulda-matchers/issues/371
  it "should have a unique password" do
    user = User.create(name: "isaac", email: "isaac.saqib@stonybrook.edu", password: "abcd1234", password_confirmation: "abcd1234")
    expect( user ).to validate_uniqueness_of(:email)
  end
end
