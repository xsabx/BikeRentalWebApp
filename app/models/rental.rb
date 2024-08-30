class Rental < ApplicationRecord
  belongs_to :bike
  belongs_to :user

  validate :start_date_cannot_be_in_the_past, :end_date_cannot_be_before_start_date
  validate :bike_must_be_available

  private

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def end_date_cannot_be_before_start_date
    if end_date.present? && end_date < start_date
      errors.add(:end_date, "can't be before the start date")
    end
  end

  def bike_must_be_available
    overlapping_rentals = Rental.where(bike_id: bike_id)
                                .where("start_date < ? AND end_date > ?", end_date, start_date)
    if overlapping_rentals.exists?
      errors.add(:base, "The bike is not available for the selected dates.")
    end
  end
end
