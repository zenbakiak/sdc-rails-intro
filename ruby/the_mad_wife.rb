# A Wife calls her programmer husband:
# Honey, please go to the market and buy milk, if they have eggs, bring six

class Husband
  attr_accessor :nickname, :place, :products

  def initialize(nickname)
    self.nickname = nickname
    self.products = []
  end

  def goto(place)
    self.place = place
  end

  def buy(product, quantity)
    self.products << {product: product, quantity: quantity}
  end
end

class Market
  def have_eggs?
    true
  end
end

@honey = Husband.new('Honey')
@walmart = Market.new
@honey.goto(@walmart)
@honey.buy('Milk', 6) if @honey.place.have_eggs?
p @honey.products