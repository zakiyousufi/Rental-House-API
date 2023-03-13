class RoomSerializer < ActiveModel::Serializer
  attributes :id, :address, :house_type, :rooms, :balcony, :size :user_id
  has_many :reservations
end
