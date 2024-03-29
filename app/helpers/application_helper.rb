# encoding: UTF-8

module ApplicationHelper
  def title
    base_title = "샘플 앱은 진리입니다."
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("logo.png", :alt => "샘플 앱", :class => "round")
  end
end
