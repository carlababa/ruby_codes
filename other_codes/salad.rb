#wash vegetables
#peel the cucumbers ans carrots
#slice the tomatos
#chop the cucumbers, lettuce, and rucola
#grate the carrots
#add ingredients to a bowl
#add seasoning

@vegetables = {"cucumbers" => 2, "carrots" => 2, "tomatos" => 3, "lettuce" => 1, "rucola" => 5}
@seasoning = ["salt", "black pepper", "olive oil"]

def wash_vegetables
  @vegetables.each do |name, number|
    puts "Wash #{number} #{name}"
    sleep 1
  end
end

def peel_vegetables(name)
  puts "Peel #{@vegetables[name]} #{name}"
  sleep 1
end

def slice_tomatos
  @vegetables.each do |name, number|
    if name == "tomatos"
      puts "Slice #{@vegetables[name]} #{name}"
    end
  end
end

def chop_vegetables
  @vegetables.each do |name, number|
    if name == "cucumbers"
      puts "Chop #{@vegetables[name]} #{name}"
      sleep 1
    elsif name == "lettuce"
      puts "Chop #{@vegetables[name]} #{name}"
      sleep 1
    elsif name == "rucola"
      puts "Chop #{@vegetables[name]} #{name}"
      sleep 1
    end
  end
end

def grate_carrots
  @vegetables.each do |name, number|
    if name == "carrots"
      puts "Grate #{@vegetables[name]} #{name}"
    end
  end
end

def add_to_bowl
  @vegetables.each do |name, number|
    puts "Add the #{name} to the bowl."
    sleep 1
  end
end

def add_seasoning
  @seasoning.each do |season|
    puts "Add some #{season}."
    sleep 1
  end
end

#Start of the Recipe
puts "Big salad Recipe."
puts "We will need:
"
@vegetables.each do |name, number|
  puts "• #{number} #{name}"
end

puts "And some seasoning like:"

@seasoning.each do |season|
  puts "• #{season}"
end


puts "Let start our salad, follow the instructions below:"

sleep 5
wash_vegetables
peel_vegetables("cucumbers")
peel_vegetables("carrots")
slice_tomatos
chop_vegetables
grate_carrots
add_to_bowl
add_seasoning

puts "That's it, enjoy your salad."
