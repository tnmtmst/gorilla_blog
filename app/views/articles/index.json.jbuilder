json.array!(@articles) do |article|
  json.extract! article, :id, :user_id, :title, :body, :body, :posted_at
  json.url article_url(article, format: :json)
end
