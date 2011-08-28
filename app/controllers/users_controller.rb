# encoding: UTF-8

class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update]
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
      sign_in @user
      flash[:success] = "샘플 앱은 진리입니다!"
      redirect_to @user
    else
      @title = "가입하기"
      @user.password = [], @user.password_confirmation = ""
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
    @title = "프로필 수정"
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "프로필 수정 완료."
      redirect_to @user
    else
      @title = "프로필 수정"
      render 'edit'
    end
  end
  
  def index
    @users = User.all
  end
  
  private

    def authenticate
      deny_access unless signed_in?
    end
end
