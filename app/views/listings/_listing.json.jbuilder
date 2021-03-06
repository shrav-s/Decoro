json.extract! listing, :id, :name, :category_id, :material_id, :price, :description, :created_at, :updated_at
json.url listing_url(listing, format: :json)
