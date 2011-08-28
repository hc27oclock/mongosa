# encoding: UTF-8

class UsersController < ApplicationController
  def new
    @title = "가입하기"
  end

  def show
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
  end
end
