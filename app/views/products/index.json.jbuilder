json.array!(@products) do |product|
  json.extract! product, :id, :category_id, :name, :sku, :price
  json.url product_url(product, format: :json)
end
