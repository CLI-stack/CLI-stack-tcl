# ============================================================
# 04_dict_keys_values.tcl — Listing keys and values
# ============================================================

set person [dict create name Alice age 30 city KL job Engineer]

# "dict keys dict ?pattern?" returns all keys (optionally filtered by glob pattern)
puts "Keys:   [dict keys   $person]"

# "dict values dict ?pattern?" returns all values (same order as keys)
puts "Values: [dict values $person]"

# Filter keys using a glob pattern — useful for namespaced keys
set d [dict create host_a 1 host_b 2 port 80 debug 0]
puts "host_* keys: [dict keys $d host_*]"   ;# only keys matching host_*

# Total number of entries
puts "Total keys:  [dict size $person]"

# Build a dict from two parallel lists (keys and values)
set keys {a b c d}
set vals {1 2 3 4}
set built [dict create]
foreach k $keys v $vals { dict set built $k $v }
puts "Built: $built"
