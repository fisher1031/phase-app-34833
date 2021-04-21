class UsersController < ApplicationController
  before_action :user_sign, only: [:show]
  
  def show
    @nickname = current_user.nickname
    @messages = current_user.messages
  end
end

private

def user_sign
  unless user_signed_in?
    redirect_to root_path
  end
end