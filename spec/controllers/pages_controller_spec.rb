require 'spec_helper'

	describe PagesController do
		render_views

		describe "GET 'home'" do
			it "should be successful" do
				get 'home'
				response.should be_success
			end
			it "should have the right title" do
				get 'home'
				response.body.should include 'Home</title>'
			end

			describe "when not signed in" do
				before(:each) do
					get :home
				end
				it "should be successful" do
					response.should be_success
				end
				it "should have the right title" do
					#response.should have_selector("title", :content => "#{@base_title} | Home")
					response.body.should include 'Home</title>'
				end
			end

			describe "when signed in" do
				before(:each) do
					@user = test_sign_in(Factory(:user))
					other_user = Factory(:user, :email => Factory.next(:email))
					other_user.follow!(@user)
				end
				it "should have the right follower/following counts" do
					get :home
					#response.should have_selector("a", :href => following_user_path(@user), :content => "0 following")
					response.body.should include '0 following'
					#response.should have_selector("a", :href => followers_user_path(@user), :content => "1 follower")
					response.body.should include '1 follower'
				end
			end



		end

		describe "GET 'contact'" do
			it "should be successful" do
			get 'contact'
			response.should be_success
		end
		it "should have the right title" do
			get 'contact'
			response.body.should include 'Contact</title>'
		end
	end

	describe "GET 'about'" do
		it "should be successful" do
			get 'about'
			response.should be_success
		end
		it "should have the right title" do
			get 'about'
			response.body.should include 'About</title>'
		end
	end
end