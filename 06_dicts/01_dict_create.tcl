# ============================================================
# 01_dict_create.tcl — Creating dictionaries
# ============================================================

# "dict create key1 val1 key2 val2 ..." creates a new dictionary
# Dicts are ordered maps: key-value pairs, keys are unique
set d1 [dict create name Alice age 30 city "KL"]
puts "d1: $d1"

# A flat list with even number of elements is also a valid dict
set d2 {name Bob age 25 city Penang}
puts "d2 size: [dict size $d2]"   ;# "dict size" counts the number of key-value pairs

# Empty dict
set empty [dict create]
puts "Empty size: [dict size $empty]"

# Build a dict incrementally using "dict set"
# dict set modifies the dict variable in place
set config [dict create]
dict set config host localhost   ;# add key "host" with value "localhost"
dict set config port 5432
dict set config db   myapp
puts "Config: $config"
