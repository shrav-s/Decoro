class Listing < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :listing_materials, dependent: :destroy
  has_many :materials, through: :listing_materials
  accepts_nested_attributes_for :listing_materials
  has_one_attached :picture
  before_save :remove_whitespaces
  before_validation :change_price_to_cents, if: :price_changed?
  

  private

  def self.search(search)
    if search
      cat = Category.find_by(name: search)
        if a
          self.where(category_id: a)
        else
          Listing.all
        end
    else
      Listing.all
    end
  end

  def remove_whitespaces
    self.name = self.name.strip.capitalize
    self.description = self.description.strip
  end

  def change_price_to_cents
    self.price = (self.price * 100).round
  end
end


