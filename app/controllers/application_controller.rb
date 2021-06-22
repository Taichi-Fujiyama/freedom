class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    #変数@current_userの値がnilまたはfalseであれば、User以下を代入するし、それ以外の場合は@current_userの値をそのまま使用するという意味になる。
  end
  
  def logged_in?
    !current_user.nil?
  end
end
