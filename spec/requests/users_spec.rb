require 'spec_helper'

describe "Users" do

	describe "signup" do
		describe "failure" do
			it "should not make a new user" do
				lambda do
					visit signup_path
					fill_in "Name", :with => ""
					fill_in "Email", :with => ""
					fill_in "Password", :with => ""
					fill_in "Confirmation", :with => ""
					click_button "Sign up"

					#get :create, controller: users
					#response.body.should include 'error_explanation'

				end.should_not change(User, :count)
			end
		end
		describe "success" do
			it "should make a new user" do
				lambda do
					visit signup_path
					fill_in "Name", :with => "Example User"
					fill_in "Email", :with => "user@example.com"
					fill_in "Password", :with => "foobar"
					fill_in "Confirmation", :with => "foobar"
					click_button "Sign up"

					#get :show, :id => @user
					#response.body.should include 'class="flash success">Welcome'

				end.should change(User, :count).by(1)
			end
		end
	end


	describe "sign in/out" do

		describe "failure" do
			it "should not sign a user in" do
				visit signin_path
				fill_in :session_email, :with => ""
				fill_in :session_password, :with => ""
				click_button "Sign in"
				#response.should have_selector("div.flash.error", :content => "Invalid")
				expect(page).to have_selector('body', text: 'Invalid')
				#expect(page).to have_content '"flash error">Invalid'
				#response.body.should include '"flash error">Invalid'
			end
		end

		describe "success" do
			it "should sign a user in and out" do
				user = Factory(:user)
				visit signin_path
				fill_in :session_email, :with => user.email
				fill_in :session_password, :with => user.password
				click_button "Sign in"
				#controller.should be_signed_in
				#click_link "Sign out"
				#controller.should_not be_signed_in
			end
		end
	end


end
