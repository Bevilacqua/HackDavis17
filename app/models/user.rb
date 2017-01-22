class User < ApplicationRecord
  has_secure_password
  has_many :memberships
	has_many :groups, through: :memberships

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
