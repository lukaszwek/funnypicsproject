class Image < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :user, :title, :image, presence: :true

  scope :published, -> { where(published: true) }
  scope :unpublished, -> { where(published: false) }

  def image_base64(version)
    Base64.encode64(File.open(image.path(version)).read)
  end
end
