class Article < ActiveRecord::Base
  belongs_to :user

  acts_as_taggable

  default_scope -> { order(posted_at: 'DESC') }
  scope :newer_than, ->(datetime) { where('posted_at > ?', datetime) }
  scope :older_than, ->(datetime) { where('posted_at < ?', datetime) }

  def undisclosed?
    Gorilla.hide_future_article && self.posted_at > DateTime.now
  end

  def newer
    Article.newer_than(self.posted_at).reorder(posted_at: 'ASC').each do |article|
      return article unless article.undisclosed?
    end
    return nil
  end

  def older
    Article.older_than(self.posted_at).each do |article|
      return article unless article.undisclosed?
    end
    return nil
  end
end
