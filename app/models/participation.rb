class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :standup

  validates :user, :standup, presence: true
end
