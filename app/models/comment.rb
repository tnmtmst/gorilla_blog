class Comment < ActiveRecord::Base
  belongs_to :article

  validates :body, presence: true

  default_scope -> { order(created_at: 'DESC') }
end
