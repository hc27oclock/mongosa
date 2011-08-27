# encoding: UTF-8

require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "시작 화면")
  end

  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "개발자에게 연락하기")
  end

  it "should have an About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "사이트 정보")
  end

  it "should have a Help page at '/help'" do
    get '/help'
    response.should have_selector('title', :content => "도움말")
  end

  it "should have a signup page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "가입하기")
  end

end
