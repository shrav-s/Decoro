class Material < ApplicationRecord
    has_many :listing_materials
    has_many :listings, through: :listing_materials
end
