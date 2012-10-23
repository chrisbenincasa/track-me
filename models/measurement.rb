class Measurement
  include Mongoid::Document
  field :mid, type: Integer
  field :date_created, type: DateTime
  field :info, type: Float
  embedded_in :track
end