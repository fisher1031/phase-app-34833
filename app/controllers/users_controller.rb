class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @messages = current_user.messages
  end
end