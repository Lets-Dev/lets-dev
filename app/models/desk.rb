class Desk < ApplicationRecord
  has_many :desk_user_memberships, dependent: :destroy
  has_many :users, through: :desk_user_memberships

  validates_presence_of :started_at, :ended_at

  before_save :set_current

  private
  def set_current
    self.current = Time.now >= self.started_at && Time.now <= self.ended_at
  end
end
