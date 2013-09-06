class Event < ActiveRecord::Base
  validates :title, uniqueness: true
  validates :organizer_name, presence: :true
  validates :date, presence: :true
  validate :future_date

  def future_date
    unless self.date == nil
    if self.date < Date.today
      errors.add(:date, "Sorry, events can't be in the past")
    end
    end
  end

end