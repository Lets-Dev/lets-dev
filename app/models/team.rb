class Team < ApplicationRecord
  has_many :team_user_memberships, dependent: :destroy
  has_many :users, through: :team_user_memberships
  has_many :team_challenge_memberships, dependent: :destroy
  has_many :challenges, through: :team_challenge_memberships
  has_many :jury_challenge_rates, through: :team_challenge_memberships

  validates :name, uniqueness: true, presence: true

  Paperclip.interpolates :name do |attachment, style|
    attachment.instance.name
  end

  has_attached_file :logo,
                    styles: {
                        original: '500x500#',
                        medium: '300x300#',
                        thumb: '100x100#'
                    },
                    url: '/uploads/:class/:attachment/:name/:style.:extension',
                    default_url: '/images/missing/:class.png'
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
  before_post_process :rename_file

  def owners
    self.team_user_memberships.owners
  end

  def admins
    self.team_user_memberships.admins
  end

  def average
    rates = self.jury_challenge_rates.pluck(:rating)
    rates.inject(&:+) / rates.size
  end

  private
  def rename_file
    self.logo.instance_write :file_name, "#{name.downcase}#{File.extname(logo_file_name)}"
  end
end
