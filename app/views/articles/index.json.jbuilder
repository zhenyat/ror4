json.array!(@articles) do |article|
  json.extract! article, :id, :authors, :title, :issue_date, :url
  json.url article_url(article, format: :json)
end
