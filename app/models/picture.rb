class Picture < ActiveRecord::Base
  belongs_to :article

  has_attached_file :image,
                    styles: {default: '720x720>'},
                    path:   "#{Rails.root}/public/pictures/:filename",
                    url:    "#{ActionController::Base.relative_url_root}/pictures/:filename"

  validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png)
  validates_attachment_presence :image
end
