class Article < ActiveRecord::Base
  belongs_to :user

  acts_as_taggable

  def future?
    self.posted_at > DateTime.now
  end
end
