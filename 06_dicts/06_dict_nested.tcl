# ============================================================
# 06_dict_nested.tcl — Nested (hierarchical) dictionaries
# ============================================================

# "dict set" accepts multiple keys to navigate nested dicts
# dict set db users alice {key val} means: db["users"]["alice"] = {key val}
set db [dict create]
dict set db users alice [dict create age 30 role admin]
dict set db users bob   [dict create age 25 role viewer]
dict set db config      [dict create host localhost port 5432]

# "dict get" with multiple keys drills into nested dicts
puts "Alice age: [dict get $db users alice age]"
puts "DB host:   [dict get $db config host]"

# Update a nested value — same multi-key syntax for dict set
dict set db users alice age 31
puts "Alice new age: [dict get $db users alice age]"

# Iterate over a nested sub-dict
puts "\nAll users:"
dict for {user info} [dict get $db users] {
    puts "  $user:"
    dict for {k v} $info { puts "    $k: $v" }
}
