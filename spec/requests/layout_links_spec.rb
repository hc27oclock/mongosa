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
  
  it "should have the right links on the layout" do
    visit root_path
    click_link "사이트 정보"
    response.should have_selector('title', :content => "사이트 정보")
    click_link "도움말"
    response.should have_selector('title', :content => "도움말")
    click_link "개발자에게 연락하기"
    response.should have_selector('title', :content => "개발자에게 연락하기")
    click_link "시작 화면"
    response.should have_selector('title', :content => "시작 화면")
    click_link "지금 가입하세요!"
    response.should have_selector('title', :content => "가입하기")
  end

  describe "when not signed in" do
    it "should have a signin link" do
      visit root_path
      response.should have_selector("a", :href => signin_path,
                                         :content => "로그")
    end
  end

  describe "when signed in" do

    before(:each) do
      @user = Factory(인:user)
      visit signin_path
      fill_in :email,    :with => @user.email
      fill_in :password, :with => @user.password
      click_button
    end

    it "should have a signout link" do
      visit root_path
      response.should have_selector("a", :href => signout_path,
                                         :content => "로그아웃")
    end

    it "should have a profile link" do
      visit root_path
      response.should have_selector("a", :href => user_path(@user),
                                         :content => "프로필")
    end 
  end
end
