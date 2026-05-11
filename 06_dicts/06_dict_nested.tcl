set db [dict create]
dict set db users alice [dict create age 30 role admin]
dict set db users bob   [dict create age 25 role viewer]
dict set db config      [dict create host localhost port 5432]

puts "Alice age: [dict get $db users alice age]"
puts "DB host:   [dict get $db config host]"

dict set db users alice age 31
puts "Alice new age: [dict get $db users alice age]"

puts "\nAll users:"
dict for {user info} [dict get $db users] {
    puts "  $user:"
    dict for {k v} $info { puts "    $k: $v" }
}
