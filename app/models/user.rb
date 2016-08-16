class User < ApplicationRecord
  acts_as_paranoid without_default_scope: true

  has_many :standups, through: :participations

  validates :email, :name, presence: true
end
