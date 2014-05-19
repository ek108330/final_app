# == Schema Information
# Schema version: <timestamp>
#
# Table name: users
#
# id :integer
# name :string(255)
# email :string(255)
# created_at :datetime
# updated_at :datetime

class User < ActiveRecord::Base
#attr_accessible :name, :email
email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :name, :presence => true,
:length => { :maximum => 50 }
validates :email, :presence => true,
:format => { :with => email_regex },
:uniqueness => { :case_sensitive => false }
end
  def create
    @user = User.new(user_params)

    if @user.save
        # do something
    else
        # do something
    end
  end

  private
    def user_params
      params.require(:user).permit(:name)
      params.require(:user).permit(:email)
    end



