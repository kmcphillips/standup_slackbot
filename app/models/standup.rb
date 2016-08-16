class Standup < ApplicationRecord
  serialize :days, Array

  has_many :users, through: :participations

  validates :name, presence: true
  validates :hour, inclusion: { in: 0..23, message: "is not a valid time" }
  validates :minute, inclusion: { in: 0..59, message: "is not a valid time" }
  validate :validate_days

  def timezone
    "EST"
  end

  def display_schedule
    "%02d:%02d on #{ display_weekdays }" % [ hour, minute ]
  end

  def display_weekdays
    days.sort.map {|d| Date::DAYNAMES[d] }.compact.join(", ")
  end

  private

  def validate_days
    if days.blank?
      errors.add(:days, "cannot be blank")
    elsif !days.all? {|day| (1..7).cover?(day) }
      errors.add(:days, "are not valid days")
    end
  end

end
