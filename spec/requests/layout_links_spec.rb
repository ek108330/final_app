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
#it "should have a signup page at '/signup'" do
#get '/signup'
#response.body.should include 'Sign up</title>'
#end
end
