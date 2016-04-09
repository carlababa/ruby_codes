#scrape the potetos
counter = 1

while counter < 6
  puts "Scrape the potato #{counter}"
  counter += 1
end

#cut potatos into thick slices
counter = 1

while counter <= 5
  puts "Cut potato #{counter}"
  counter += 1
end

for counter in 1...6 #... exclusive or use .. to include the last number 1..5
  puts "Add potato #{counter} to the pan"
end

eggs = [0, 1, 2, 3, 4, 5]

#collections are plural, item is singular
eggs.each do |egg|
  puts "Break the egg #{egg}"
end

ingredients = { "onions" => 2, "potatos" => 5, "eggs" => 6}

#first always key second always value
ingredients.each do |name, number|
  puts "Take #{number} #{name}"
end

##############################################
def get_age_and_name
  puts "What's your name?"
  name = gets.chomp

  puts "Whats your age?"
  age = gets.chomp.to_i

  return name
  return age
end

def ask_gender
  gender = ""

  while gender != "M" && gender != "V"
    puts "What is your gender?"
    gender = gets.chomp
    gender.upcase!
  end
  return gender
end

name, age = get_age_and_name
gender = aks_gender

################################################
students = []

student1 = {"name" => "Brian", "age" => 22, "profission" => "Business"}

students << student1

students = [{student1}]

students[0] #{'name' => "brian", ...}

student2 = {"name" => "Jess", "age" => 32, "profission" => "Cooker"}
students << student2

students[1] #{'name' => "jess", ...}

students = [{student1}, {student2}]

students[1]["age"] # 32
students[0]["name"] # brian

students.each do |student|
  puts "Nice to meet you #{student["name"]}, your age is #{student["age"]}"
end
