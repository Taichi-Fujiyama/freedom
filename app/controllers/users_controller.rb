class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
     @user = User.new(user_params)
     @user.role = 0
    if @user.save
      redirect_to home_path, success:"登録が完了しました"
    else
      flash.now[:danger] = "登録に失敗しました 　※パスワードは8〜32字。大小字を含むアルファベット、数字をそれぞれ１文字以上組み合わせて下さい。"
      render :new
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end

