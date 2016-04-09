class Cat
  def initialize(name, fur_color)
    @name = name
    @fur_color = fur_color
  end
  def sound
    puts "#{@name} says prrrrrr"
  end
end


# cat1.name doesn't work because there is no method defined, create a method to this
#or user attr_accessor, it generates methods

class Dog
  attr_accessor :name
  attr_accessor :fur
  def initialize(name, fur_color)
    @name = name
    @fur_color = fur_color
  end
  def sound
    puts "#{@name} says auau"
  end
end

class Product
  attr_accessor :name, :description, :price, :id

  def initialize(name, description, price, id)
    @name = name
    @description = description
    @price = price
    @id = id
  end
end

class Inventory
  def initialize
    @products = []
    for i in 0..999 do
      @products << Product.new("#{i}Name", "#{i}description", i.to_f, i )
    end
  end
  def get_product product_name
    @products.each do |product|
      if product.name == product_name
        return product
      end
    end
    "ow no its not here"
  end
end

class Shop
  def initialize
    @inventory = Inventory.new
  end
  def what_is_in_store
    p @inventory.inspect
  end
  def shop_for_item
    what_is_in_store

    puts "Select item to buy by product name"
    name = gets.chomp

    result = @inventory.get_product name
    p result
  end
end

shop = Shop.new
shop.shop_for_item
