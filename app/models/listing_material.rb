class ListingMaterial < ApplicationRecord
  belongs_to :listing
  belongs_to :material
end
