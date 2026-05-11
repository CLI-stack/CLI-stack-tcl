set person [dict create name Alice age 30 city KL job Engineer]

puts "Keys:   [dict keys   $person]"
puts "Values: [dict values $person]"

set d [dict create host_a 1 host_b 2 port 80 debug 0]
puts "host_* keys: [dict keys $d host_*]"
puts "Total keys:  [dict size $person]"

# Build dict from parallel lists
set keys {a b c d}
set vals {1 2 3 4}
set built [dict create]
foreach k $keys v $vals { dict set built $k $v }
puts "Built: $built"
