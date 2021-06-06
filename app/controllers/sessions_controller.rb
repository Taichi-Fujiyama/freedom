class SessionsController < ApplicationController #ログイン用のコントローラはsessionsを用いいるため、Sessionsコントローラとした
  def new
  end
  
  def create
    user = User.find_by(email: params[:sessions][:email])
    if user && user.authenticate(params[:sessions][:password])
      log_in user
      redirect_to root_path, success: "ログインに成功しました"
    else
      flash.now[:danger] = "メールアドレスもしくはパスワードが間違っています"
      render :new
    end
  end
  
  
  
  def destroy
    log_out
    redirect_to root_path, info: "ログアウトしました"
  end
  
  private
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
end
