class Product
  attr_accessor :name, :description, :price, :id
  def initialize(name, description, price, id)
      @name = name
      @description = description
      @price = price
      @id = id
  end
end

class Category
  def initialize(name, products)
    @name = name
    @products = products
  end
  def name
    @name
  end
  def products
    @products
  end
end

class Inventory
  def initialize
    @categories = []
    candy_products = [
      Product.new("cola bottle", "a nice candy", 0.05, 1),
      Product.new("frog", "a green frog", 0.05, 2),
      Product.new("chocolate cigarettes", "dont light them!", 0.25, 3)];
    @categories << Category.new( "Candy",  candy_products)
    beer_products = [
      Product.new("Amstel", "a nice brew", 1.5, 1),
      Product.new("Heineken", "Green beer", 2, 2)
      ];
    @categories << Category.new( "Beer",  beer_products)
  end
  def get_product product_name
    @categories.each do |category|
      category.products.each do |product|
        if product.name == product_name
          return product
        end
      end
    end
    "ow no its not here"
  end

  def list
    @categories.each do |category|
      puts category.name
      category.products.each do |product|
          puts "-- #{product.name}"
      end
    end
  end
end

class Shop
  def initialize
    @inventory = Inventory.new
    @cart = Cart.new
  end
  def what_is_in_store
    @inventory.list
  end
  def get_help
    "How can I be of assistance"
  end
  def checkout
    "That will be #{@cart.total_amount}"
  end
  def options_menu
    puts "1: catalogue"
    puts "2: get help"
    puts "3: checkout"
    puts "4: whats in my cart"
  end
  def whats_in_my_cart
    @cart.list
  end
  def shop_for_item
    shopping = true

    while shopping do
      options_menu
      puts "How can I help you?!"

      choice = gets.chomp.to_i

      if(choice == 1)
        what_is_in_store
        name = gets.chomp

        product = @inventory.get_product name
        @cart.add_product(product)

      end
      if(choice == 2)
        get_help
      end
      if(choice == 3)
        checkout
        shopping = false
      end
      if(choice == 4)
        whats_in_my_cart
      end
    end
  end
end

class Cart
  def initialize
    @products = []
  end
  def add_product product
    @products << product
  end

  def total_amount
    sum = 0
    @products.each do |product|
      sum += product.price
    end
    return sum
  end

  def list
    puts "--------------------------------"
    puts "You have in your shopping cart"
    @products.each do |product|
      puts product.name
    end
    puts total_amount.to_s
    puts "--------------------------------"
  end
end

#Execution

shop = Shop.new
shop.shop_for_item
