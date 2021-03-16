module ListingsHelper

    def price_to_dollars(price)
        number_with_precision price/100, precision: 2
    end
end
