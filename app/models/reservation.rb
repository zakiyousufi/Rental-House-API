class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :house

  validates :from_date, :to_date, presence: true
  validate :to_date_after_from_date
  validates :number_of_persons, presence: true, numericality: { greater_than: 0, only_integer: true }

  private

  def to_date_after_from_date
    return if to_date.blank? || from_date.blank?

    return unless to_date < from_date

    errors.add(:to_date, 'must be after the from date')
  end
end
