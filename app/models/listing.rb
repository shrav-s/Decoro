class Listing < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :listing_materials, dependent: :destroy
  has_many :materials, through: :listing_materials
  accepts_nested_attributes_for :listing_materials
end
