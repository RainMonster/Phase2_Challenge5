class Event < ActiveRecord::Base
  validates :title, uniqueness: true
  validates :organizer_name, presence: :true
  validates :date, presence: :true
  validate :future_date

  def future_date
    if (self.date - Date.today) < 0
      errors.add(:date, "Date cannot be in the past")
    end
  end

end
