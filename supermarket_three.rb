module SupermarketThree
  class Checkout
    def initialize(prices)
      @prices = prices
      @sales_log = []
      @total = 0
      @discount = 0
    end

    def scan(*items)
      items.each do |item|
        log_sale(item)
        increase_total(item)
      end
    end

    def total
      apply_discounts
      @total
    end

    private

    def apply_discounts
      prices[:discounts].each do |product|
        while receipt.count(product[:name]) >= product[:quantity]
          decrease_total(product[:discount])
          product[:quantity].times do
            @sales_log.slice!(@sales_log.index(product[:name]))
          end
        end
      end
    end

    def receipt
      @sales_log.sort
    end

    def log_sale(item)
      @sales_log << item
    end

    def increase_total(item)
      @total += prices[item]
    end

    def decrease_total(amount)
      @total -= amount
    end

    def prices
      @prices
    end
  end
end
