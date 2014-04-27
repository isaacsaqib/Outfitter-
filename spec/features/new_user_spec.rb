require 'spec_helper'

describe "visiting the site" do
  describe "a new user visits the home page" do
    it "displays logo" do
      visit root_path
      expect( page ).to have_content "O U T FT T E R" #case sensitive
    end

    it "displays a sign up link " do
      visit root_path
      expect( page ).to have_content "O U T FT T E R" #case sensitive
      expect( page).to have_content "Sign up"
    end

    it "displays a log in link" do
      visit root_path
      expect( page ).to have_content "O U T FT T E R" #case sensitive
      expect( page ).to have_content "Login"
    end

    it "signs you up" do
      visit root_path
      expect( page ).to have_content "O U T FT T E R"
      click_link "Sign up"
      expect( page ).to have_content "Please fill in your information below"
      expect(current_path).to eq "/users/new"
    end

    it "logs you in" do
      visit root_path
      expect( page ).to have_content "O U T FT T E R"
      click_link "Login"
      expect( page ).to have_content "Login:"
      expect(current_path).to eq "/session/new"
    end

    it "lets you log in" do
     visit root_path
      expect( page ).to have_content "O U T FT T E R"
      click_link "Login"
      expect( page ).to have_content "Login:"
      expect(current_path).to eq "/session/new"
      fill_in(@user_email, {:with => "Lambda@lambda.com"})
      fill_in(@user_password, {:with => "abcd1234"}
    end







#       expect( page.has_css?('img[alt="giant rat"]') ).to be_true
#     end

#     it "has a signup link" do
#       visit root_path
#       click_link "Sign up"
#       expect(page).to have_content "Please enter your name"
#       expect(current_path).to eq "/users/new"
#     end
#   end
# end


# describe "creating a user" do
#   describe "signing up with valid credentials" do
#     let(:user) { FactoryGirl.build(:user) }
#     it "takes us to the homepage and says thanks for signing up" do
#       visit root_path
#       click_link "Sign up"
#       fill_in(@user_email, {:with => "Lambda@lambda.com"})
#       click_button("Sign Up!")
#     end


#   describe "signing up without an email" do
#     it "should say please enter an email if the email field is blank" do
#       visit root_path
#       click_link "Sign up"
#       fill_in(@user_email, {:with => nil})
#       click_button("Sign Up")
#     end
#   end

#     def sign_up(user)
#     visit root_path
#     click_link "Sign up"
#     fill_in "Email", with: "user.email"
#     click_button "Sign Up!"
#     end

#     def login(user)
#     visit root_path
    # end
end
end

