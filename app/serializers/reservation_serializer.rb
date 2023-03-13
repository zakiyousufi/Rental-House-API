class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :from_date, :to_date, :number_of_persons, :house
  belongs_to :house
end
