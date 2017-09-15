class Language < ApplicationRecord
  has_many :language_set_memberships, dependent: :destroy
  has_many :language_sets, through: :language_set_memberships

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

  private
  def rename_file
    self.logo.instance_write :file_name, "#{name.downcase}#{File.extname(logo_file_name)}"
  end
end
