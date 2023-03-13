class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_one_attached :image

  validates :balcony, inclusion: { in: [true, false] }
  validate :check_file_presence

  def check_file_presence
    errors.add(:image, 'no image added') unless image.attached?
  end
end
