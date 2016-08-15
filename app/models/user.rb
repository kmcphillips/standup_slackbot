class User < ApplicationRecord
  acts_as_paranoid without_default_scope: true

  validates :email, :name, presence: true
end
