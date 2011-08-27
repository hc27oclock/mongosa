# encoding: UTF-8

class PagesController < ApplicationController
  def home
    @title = "시작 화면"
  end

  def contact
    @title = "개발자에게 연락하기"
  end

  def about
    @title = "사이트 정보"
  end
  
  def help
    @title = "도움말"
  end
end
