# encoding: UTF-8

class UsersController < ApplicationController
  def new
    @user = User.new
    @title = "가입하기"
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "샘플 앱은 진리입니다!"
      redirect_to @user
    else
      @title = "가입하기"
      render 'new'
    end
  end
  
  def index
    @users = User.all
  end
end
