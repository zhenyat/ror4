json.array!(@contents) do |content|
  json.extract! content, :id, :article_id, :doc
  json.url content_url(content, format: :json)
end
