class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email].downcase)
    if @user && @user.authenticate(params[:password])
      login(@user)
      flash[:success] = "ログインに成功しました"
      redirect_to root_path
    else
      flash[:warning] = "メールアドレス、またはパスワードが間違っています"
      redirect_to login_path
    end
  end

  def destroy
    logout
    flash[:success] = "ログアウトしました"
    redirect_to root_url
  end

  private

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session[:user_id] = nil
  end
end
