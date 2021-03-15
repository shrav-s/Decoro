class PagesController < ApplicationController
  def home
  end

  def payment_success
    pp params
    listing_id = params[:listingId]
    @listing = Listing.find(listing_id)
    @purchase = Order.find_by_listing_id(listing_id )
  end
end
