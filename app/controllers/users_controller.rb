class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(name: params[:name], email: params[:email])
    if @user.save
      redirect_to root_path, success:"登録が完了しました"
    else
      flash[:warning] = "登録に失敗しました"
      render :new
    end
  end
end
