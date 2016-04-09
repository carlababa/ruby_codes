class Product
  attr_accessor :name, :quantity, :price

  def initialize(name, quantity, price)
    @name = name
    @quantity = quantity
    @price = price
  end
  def price
    @price
  end
  def name
    @name
  end
  def quantity
    @quantity
  end
end
