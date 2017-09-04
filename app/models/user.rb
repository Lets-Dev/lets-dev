class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :github, :google_oauth2]

  has_many :subscriptions
  has_many :team_user_memberships
  has_many :teams, through: :team_user_memberships
  has_many :desk_user_memberships
  has_many :desks, through: :desk_user_memberships
  has_many :jury_challenge_memberships

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true
  validates :facebook_id, uniqueness: true, allow_blank: true
  validates :github_id, uniqueness: true, allow_blank: true
  validates :google_oauth2_id, uniqueness: true, allow_blank: true

  Paperclip.interpolates :username do |attachment, style|
    attachment.instance.username
  end

  has_attached_file :avatar,
                    styles: {
                        original: '500x500#',
                        medium: '300x300#',
                        thumb: '100x100#'
                    },
                    url: '/uploads/:class/:attachment/:username/:style.:extension',
                    default_url: '/images/missing/:class.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  before_post_process :rename_file

  def update_omniauth(auth)
    self["#{auth.provider}_id"] = auth.uid
    self["#{auth.provider}_name"] = auth.info.name
    self["#{auth.provider}_image"] = auth.info.image
    self.github_username = auth.info.nickname if auth.provider == 'github'
    self.save
  end

  def self.from_omniauth(auth)
    u = where(email: auth.info.email).or(where("#{auth.provider}_id" => auth.uid)).first_or_create do |user|
      user.username = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user["#{auth.provider}_id"] = auth.uid
      user["#{auth.provider}_name"] = auth.info.name
      user["#{auth.provider}_image"] = auth.info.image
      user['github_username'] = auth.info.nickname if auth.provider == 'github'

      user.skip_confirmation!
    end
    u.update_omniauth(auth) if u["#{auth.provider}_id"].nil?
    u
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if (data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info'])
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  def admin?
    self.desks.where(current: true).size > 0
  end

  def github_repos
    Github.repos.list user: self.github_username
  end

  def is_owner_of?(team)
    team.owners.pluck(:user_id).include?(self.id)
  end

  def is_admin_of?(team)
    team.admins.pluck(:user_id).include?(self.id)
  end

  def has_team?
    team_user_memberships.where(ended_at: nil).size > 0
  end

  def current_team
    return team_user_memberships.where(ended_at: nil).first.team if team_user_memberships.where(ended_at: nil).size > 0
    nil
  end

  private
  def rename_file
    self.avatar.instance_write :file_name, "#{username.downcase}#{File.extname(avatar_file_name)}"
  end
end
