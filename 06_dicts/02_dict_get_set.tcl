set person [dict create name Alice age 30 city KL]

puts "Name: [dict get $person name]"
puts "Age:  [dict get $person age]"

if {[dict exists $person email]} {
    puts "Email: [dict get $person email]"
} else {
    puts "No email key"
}

dict set person age 31
dict set person email "alice@example.com"
puts "Updated: $person"

dict unset person city
puts "After unset: $person"
puts "Keys: [dict size $person]"
