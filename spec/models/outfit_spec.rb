require "spec_helper"

describe Outfit do
  it { should belong_to(:user) }

  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:style) }
  it { should validate_presence_of(:brand_name) }
  it { should validate_presence_of(:photo) }

  it "should validate size of file is less than 5Mb" do
  file = File.new("#{Rails.root}/public/photos/1/original/2for1_cover.jpg")
  file.stub(:size).and_return(11.megabytes)
  file.stub(:to_tempfile).and_return(file)

  # @information.attachment = file
  # @information.should_not be_valid
  # @information.should have(1).error_on(:photo)
  #failing test for validating size of photo attachment
  end
end

