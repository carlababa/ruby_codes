# require './contacts_file'

toys = []

toys << { name: "Small Doll", quantity: 12 , id: 1 }
toys << { name: "Big Doll", quantity: 10 , id: 2 }
toys << { name: "Red Car", quantity: 15 , id: 3 }
toys << { name: "Blue Car", quantity: 8 , id: 4 }
toys << { name: "Fluffy Bear", quantity: 6 , id: 5 }

# write_contacts( contacts )

def index(toys)
  toys.each_with_index do |toy, i|
    puts "#{i + 1}) #{toy[:name]}"
  end
end


def show(toy)
  puts "#{toy[:name]}"
  puts "quantity: #{toy[:quantity]}"
  puts "id: #{toy[:id]}"
end

index(toys)

puts
print "Who would you like to see? "
response = gets.chomp

i = response.to_i

toy = toys[i-1]

puts
show(toy)

def ask(prompt)
  print prompt
  gets.chomp
end
#
# def create_new
#   contact = {}
#
#   puts
#   puts "Enter contact info:"
#   contact[:name] = ask "Name? "
#   contact[:phone] = ask "Phone? "
#   contact[:email] = ask "E-mail? "
#
#   contact
# end
#
# def action_new(contacts)
#   contact = create_new
#
#   contacts << contact
#   write_contacts(contacts)
#
#   puts
#   puts "New contact created:"
#   puts
#
#   show(contact)
#   puts
# end
#
# def action_show(contacts, i)
#   contact = contacts[i - 1] #looks for index of array
#
#   puts
#   puts show(contact)
#   puts "*" * 40
# end
#
# def action_delete(contacts)
#   puts
#   response = ask("Delete which contact?")
#   i = response.to_i
#
#   puts
#   puts "Contact for #{contacts[i-1][:name]} deleted."
#
#   contacts.delete_at(i-1)
#   write_contacts(contacts)
#   puts
# end
#
# def action_error
#   puts
#   puts "Sorry, I don't recognize that command."
#   puts
# end
#
# def action_search(contacts)
#   puts
#   pattern = ask("Search for?")
#   puts
#
#   contacts.each do |contact|
#     if contact[:name] =~ /\b#{pattern}/i
#       show(contact)
#       puts
#     end
#   end
# end
#
# loop do
#
#   contacts = read_contacts
#   index(contacts)
#
#   puts
#   response = ask("Who would you like to see (n for new, d to delete, s for search, q to quit)?")
#
#   break if response == "q"
#   if response == "n"
#     action_new(contacts)
#   elsif response == "d"
#     action_delete(contacts)
#   elsif response == "s"
#     action_search(contacts)
#   elsif response =~ /[0-9]+/
#     action_show(contacts, response.to_i)
#   else
#     action_error
#   end
# end
#
# puts
# puts "Bye"
