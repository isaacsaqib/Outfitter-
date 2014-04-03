require 'spec_helper'

describe Comment do
  it { should belong_to(:user) }
  it { should belong_to(:outfit) }
  it { should validate_presence_of(:text_section) }
end
