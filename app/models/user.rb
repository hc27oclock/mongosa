class User
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes
  field :name
  field :email
  validates_presence_of :name
end
