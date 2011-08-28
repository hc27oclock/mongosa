# encoding: UTF-8

class SessionsController < ApplicationController
  def new
    @title = "로그인"
  end
  
  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "이메일과 비밀번호의 조합이 불일치합니다."
      @title = "로그인"
      render 'new'
    else
      sign_in user
      redirect_to user
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
