require 'spec_helper'
describe UsersController do
render_views
describe "GET 'new'" do
it "should be successful" do
get 'new'
response.should be_success
end
#it "should have the right title" do
#get 'new'
#response.body.should include 'Sign up</title>'
#end
end
end
