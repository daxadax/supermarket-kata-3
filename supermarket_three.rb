module SupermarketThree
  class Checkout
    def initialize(prices)
      @prices = prices 
      @total = 0
    end

    def scan(*items)
      items.each do |item|
        increase_total(item)
      end
    end

    def total
      @total
    end

    private

    def increase_total(item)
      @total += prices[item]
    end

    def prices
      @prices
    end
  end
end
