class Listing < ApplicationRecord
  belongs_to :category
  belongs_to :material
end
