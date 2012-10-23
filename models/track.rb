class Track
  include Mongoid::Document
  field :tid, type: Integer
  field :date_created, type: DateTime
  field :name, type: String
  field :units, type: String
  belongs_to :user
  embeds_many :measurements
end