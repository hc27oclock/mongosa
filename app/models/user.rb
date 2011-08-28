class User
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes
  attr_accessible :name, :email
  field :name
  field :email
  validates_presence_of :name
  validates_length_of :name, maximum: 50
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence   => true,
                    :format     => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
end
