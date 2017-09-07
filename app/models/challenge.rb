require 'redcarpet/render_strip'

class Challenge < ApplicationRecord
  belongs_to :language_set, optional: false

  has_many :language_set_memberships, through: :language_set
  has_many :languages, through: :language_set_memberships
  has_many :team_challenge_memberships, dependent: :destroy
  has_many :teams, through: :team_challenge_memberships
  has_many :jury_challenge_memberships, dependent: :destroy
  has_many :jurys, through: :jury_challenge_memberships, source: :user
  has_many :challenge_rating_criteria
  has_many :jury_challenge_rates, through: :challenge_rating_criteria

  validates_presence_of :title, :subject, :starts_at, :ends_at

  scope :published, -> () { where('starts_at <= ?', Time.now) }
  scope :ended, -> () { where('ends_at <= ?', Time.now) }
  scope :current, -> () { where('starts_at <= ? AND ends_at > ?', Time.now, Time.now) }

  def can_be_rated?
    self.ends_at > Time.now - 1.month && self.ends_at < Time.now
  end
end
