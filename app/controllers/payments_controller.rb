class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]
    def webhook
        payment_intent_id = params[:data][:object][:payment_intent]
        pp params[:data][:object][:chrges]
        payment = Stripe::PaymentIntent.retrieve(payment_intent_id)
        pp payment.charges
        listing_id = payment.metadata.listing_id
        buyer_id = payment.metadata.user_id
        puts "listing: #{payment.metadata.listing_id}"
        puts "buyer: #{payment.metadata.user_id}"
        listing = Listing.find(listing_id)
        listing.purchased = true
        listing.save
        Order.create(user_id: buyer_id, listing_id: listing_id, payment_intent_id: payment_intent_id, receipt_url: payment.charges.data[0].receipt_url)
    end
end
