class Question < ApplicationRecord
  belongs_to :standup

  validates :body, :standup, presence: true
end
