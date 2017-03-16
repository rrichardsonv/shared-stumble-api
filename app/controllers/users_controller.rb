class UsersController < ApplicationController
  skip_before_action :auth_with_key

  def create
    @user = User.new(user_deetz)
    if @user.save
      render json: {status: 'Success!', data: {key: @user.key}}, status: :created
    else
      render json: {msg: @user.errors.full_messages}, status: :bad_request
    end
  end

  private

  def user_deetz
    params.require('user').permit('name','email')
  end
end