class Picture < ActiveRecord::Base
  belongs_to :article

  has_attached_file :image,
                    :styles => {:thumb => "300x300>"}
                    :path => "#{Rails.root}/public/picture/:article_id/:filename",
                    :url  => "#{ActionController::Base.relative_url_root}/picture/:article_id/:filename"

  Paperclip.interpolates :article_id do |attachment, style|
    "#{attachment.instance.article_id}"
  end
end
