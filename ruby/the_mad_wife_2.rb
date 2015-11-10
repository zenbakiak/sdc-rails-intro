# A Wife calls her programmer husband:
# Honey, While you are out buy some milk

class Husband
  attr_accessor :nickname, :products

  def initialize(nickname)
    self.nickname = nickname
    self.products = []
  end

  def home?
    false
  end

  def buy(product, quantity)
    self.products << {product: product, quantity: quantity}
    puts "your cart have: #{self.products}"
  end
end

@honey = Husband.new('Honey')

begin
  @honey.buy('milk', 1)
end while !@honey.home?

#begin
#  @honey.buy('milk', 1)
#end unless @honey.home?
