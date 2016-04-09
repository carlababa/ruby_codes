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

@inventory = []
@cart = 0.0
@chekbox = {}

def add_to_inventory(name, quantity, price)
  @inventory << Product.new(name, quantity, price)
end

def build_inventory
  add_to_inventory("banana", 5, 2.50)
  add_to_inventory("avocado", 6, 1.80)
  add_to_inventory("melon", 1, 4.00)
  add_to_inventory("coconut", 2, 3.50)
end

def manage_inventory
  puts "Do you want to add something to your inventory (y/n)?"
  answer = gets.chomp.downcase
  if answer == "y"
    puts "What is the name of the product?"
    name = gets.chomp.downcase
    puts "What is the quantity of the product?"
    quantity = gets.chomp.to_i
    puts "What is the price of the product?"
    price = gets.chomp.to_f

    # @inventory << Product.new(name, quantity, price)
    add_to_inventory(name, quantity, price)
    manage_inventory
  end
end

def show_inventory
  puts "This is what I have to offer:"
  @inventory.each do |product|
    puts "• #{product.quantity} #{product.name}"
  end
end

def get_product(name)
  @inventory.each do |product|
    if product.name == name
      return product
    end
  end
end

def get_product_price(name)
  return get_product(name).price
end

def remove_from_inventory(name, quantity)
  get_product(name).quantity -= quantity
  # p get_product(name).quantity
end

def re_add_to_inventory(name, quantity)
  get_product(name).quantity += quantity
  # p get_product(name).quantity
end

def add_to_cart(name, quantity)
  @chekbox[name] = {
    "quantity" => quantity
  }
  cost_per_item = get_product_price(name)
  puts cost_per_item
  @cart += (cost_per_item * quantity)
  remove_from_inventory(name, quantity)
end

def remove_from_cart
  puts "Do you want to remove something (y/n)?"
  answer = gets.chomp.downcase
  if answer == "y"
    puts "What do you want to remove?"
    name = gets.chomp.downcase
    quantity = 1
    quantity = @chekbox[name]["quantity"]
    re_add_to_inventory(name, quantity)
    cost_per_item = get_product_price(name)
    @cart -= (cost_per_item * quantity)
    @chekbox.delete(name)
  end
end

def show_contents_of_the_cart
  puts "Your cart holds:"
  @chekbox.each do |name, quantity|
    puts "• #{@chekbox[name]["quantity"]} #{name}"
  end
  puts "Total cart value: €#{@cart.round(2)}"
end

def customer_discount
  puts "Do you have our membership card (y/n)?"
  answer = gets.chomp.downcase
  if answer == "y"
    @cart *= 0.95
    puts "You 5% discount! This is the final amount to pay:

    #{@cart.round(2)} euros."
  else
    puts "Sorry, no discount for you!
    Please pay #{@cart} euros.
    "
  end
end

def pay
  puts "Fill the amount do you want to pay:"
  value = gets.chomp.to_f

  if value != @cart
    if value <= @cart
      @cart -= value
      puts "You need to pay more #{@cart.round(2)} euros."
      pay
    elsif value >= @cart
      value -= @cart
      puts "This is your change, #{value.round(2)}. Thank you!"
    else
    puts "You paid everything! Thank you!"
  end
  else
    puts "You paid everything! Thank you!"
  end
end

def in_stock?(product, quantity)
  get_product(product).quantity >= quantity
end

def in_stock!
  if @product == get_product(@product).name
    print "The #{@product} costs "
    print get_product_price(@product)
    print " euros."
    how_many(@product)
  else
    puts "We're fresh out of #{@product}, sorry!"
  end
end

def how_many(product)
  puts "How many #{product} do you want?"
  quantity = gets.chomp.to_i
  if in_stock?(product, quantity)
    add_to_cart(product, quantity)
  else
    puts "We're fresh out of #{product}, sorry!"
  end
end

puts "Choose one option below:
1 Customer
2 Manager
"
choice = gets.chomp.to_i
if choice == 2
  manage_inventory
end

puts "Welcome to my fruit store!"
build_inventory
show_inventory


def questions
  puts "What do you want to buy?"
  @product = gets.chomp.downcase
  in_stock!

  puts "You have #{@cart} euros to pay."
  puts "Do you want to buy more [y/n]"
  buy = gets.chomp.downcase

  if buy == "y"
    show_inventory
    questions
  else
    show_contents_of_the_cart
    remove_from_cart
    show_contents_of_the_cart
    customer_discount
    pay
  end
end

questions
