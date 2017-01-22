class Group < ApplicationRecord
  before_create :generate_join_id

  has_many :memberships
  has_many :users, through: :memberships
  has_many :items

  # generate_join_id
  # ================
  # generates an id for the group
  def generate_join_id
    begin
      self.join_id = SecureRandom.hex
    end while self.class.exists?(join_id: join_id)
  end
end
