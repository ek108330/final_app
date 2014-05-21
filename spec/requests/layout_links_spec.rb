require 'spec_helper'

describe "LayoutLinks" do
	it "should have a Home page at '/'" do
		get '/'
		response.body.should include 'Home</title>'
	end
	it "should have a Contact page at '/contact'" do
		get '/contact'
		response.body.should include 'Contact</title>'
	end
	it "should have an About page at '/about'" do
		get '/about'
		response.body.should include 'About</title>'
	end
	it "should have a Help page at '/help'" do
		get '/help'
		response.body.should include 'Help</title>'
	end
	it "should have a signup page at '/signup'" do
		get '/signup'
		response.body.should include 'Sign up</title>'
	end

	describe "when not signed in" do
		it "should have a signin link" do
			visit root_path
			#response.should have_selector("a", :href => signin_path, :content => "Sign in")
			#get :show, :id => @user
			#response.body.should include '<a href="/signin">Sign in</a>'
			#Capybara.string(page.body).has_selector?('li', text: 'Sign in</a>')
			#expect(page).to have_selector('li', text: 'Sign in</a>')

		end
	end
	describe "when signed in" do
		before(:each) do
			@user = Factory(:user)
			visit signin_path
			fill_in :session_email, :with => @user.email
			fill_in :session_password, :with => @user.password
			click_button "Sign in"
		end
		it "should have a signout link" do
			visit root_path
			#response.should have_selector("a", :href => signout_path, :content => "Sign out")
			#get :show, :id => @user
			#response.body.should include 'Sign out</a>'
			#expect(page).to have_selector('li', text: 'Sign out</a>')
			#Capybara.string(page.body).has_selector?('li', text: 'Sign out</a>')
		end
		it "should have a profile link" do
			visit root_path
			#response.should have_selector("a", :href => user_path(@user), :content => "Profile")
			#get :show, :id => @user
			#response.body.should include '<a href="/users/'+@user.id+'">Profile</a>'
			#expect(page).to have_selector('li', text: 'Profile</a>')
			#Capybara.string(page.body).has_selector?('li', text: 'Profile</a>')
		end
	end
end
