class User
  include Mongoid::Document 
  field :name, type: String
  field :salt, type: String
  field :password, type: String
  field :email, type: String
  field :uid, type: Integer
  has_many :tracks
end