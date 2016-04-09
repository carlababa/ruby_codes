class Shop
  def initialize(greeting="Welcome!")
    @greeting = greeting
    @main_menu = Menu.new(self, "What would you like to do?",
      [
        { title: "Shop", action: :shop_for_item },
        { title: "Show Cart", action: :show_cart},
        { title: "Delete from Cart", action: :delete_from_cart },
        { title: "Check-out", action: :check_out },
        { title: "Exit", action: :exit }
      ]
    )
  end
​
  def start
    puts @greeting
    puts
    @main_menu.list_and_choose
  end
​
  def shop_for_item
    puts "you accessed shop for item"
    @main_menu.list_and_choose
  end
​
  def show_cart
    puts "you accessed show cart"
    @main_menu.list_and_choose
  end
​
  def delete_from_cart
    puts "you accessed delete from cart"
    @main_menu.list_and_choose
  end
​
  def check_out
    puts "you accessed check out"
    @main_menu.list_and_choose
  end
​
  def exit
    puts "Goodbye!"
  end
end
​
class Menu
  def initialize(shop,greeting,items)
    @shop = shop
    @greeting = greeting
    @items = items
  end
​
  def list
    puts @greeting
    @items.each_with_index do |menu_item,index|
      puts "#{index + 1}. #{menu_item[:title]}"
    end
  end
​
  def choose
    print "\nPlease enter a number: "
    choice = gets.strip.to_i
    while choice < 1 || choice > @items.length
      print "\nPlease enter a number between 1 and #{@items.length}: "
      choice = gets.strip.to_i
    end
    @shop.send @items[choice - 1][:action]
  end
​
  def list_and_choose
    list
    choose
  end
end
​
shop = Shop.new("Welcome to Jessica's Fabulous Bazaar!")
​
shop.start
