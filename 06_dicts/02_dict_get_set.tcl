# ============================================================
# 02_dict_get_set.tcl — Reading and writing dict values
# ============================================================

set person [dict create name Alice age 30 city KL]

# "dict get dict key" retrieves the value for a key
# Throws an error if the key does not exist
puts "Name: [dict get $person name]"
puts "Age:  [dict get $person age]"

# Safe access: check with "dict exists" before calling "dict get"
if {[dict exists $person email]} {
    puts "Email: [dict get $person email]"
} else {
    puts "No email key"
}

# "dict set dictVar key value" updates the value for an existing key
# or adds a new key-value pair if the key doesn't exist
dict set person age 31
dict set person email "alice@example.com"
puts "Updated: $person"

# "dict unset dictVar key" removes a key-value pair
dict unset person city
puts "After unset: $person"

# "dict size" returns the count of key-value pairs
puts "Keys: [dict size $person]"
