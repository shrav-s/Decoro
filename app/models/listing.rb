class Listing < ApplicationRecord
  belongs_to :category
  has_many :listing_materials
  has_many :materials, through: :listing_materials
  accepts_nested_attributes_for :listing_materials
end
