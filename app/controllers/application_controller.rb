class ApplicationController < ActionController::API
  before_action :auth_with_key

  def auth_with_key
    @user = User.find_by({key: params[:key]})
    !!@user
  end
end
