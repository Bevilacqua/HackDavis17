class User < ApplicationRecord
  before_create :generate_color
  has_secure_password
  has_many :memberships
  has_many :groups, through: :memberships

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  # generate_color
  # ==============
  # Generates a random color
  def generate_color
    self.color = "%06x" % (rand * 0xffffff)
  end
end
