class Article < ActiveRecord::Base
  belongs_to :user

  acts_as_taggable

  def undisclosed?
    Gorilla.hide_future_article && self.posted_at > DateTime.now
  end
end
