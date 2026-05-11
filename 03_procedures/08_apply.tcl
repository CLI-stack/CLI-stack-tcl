set square [list {x} { expr {$x * $x} }]
puts [apply $square 5]
puts [apply $square 12]

set add [list {a b} { expr {$a + $b} }]
puts [apply $add 3 7]

# lmap with inline lambda
set nums {1 2 3 4 5}
set doubled [lmap n $nums { expr {$n * 2} }]
puts "Doubled: $doubled"

set greet {{name} { return "Hello, $name!" }}
puts [apply $greet "World"]
puts [apply $greet "Azman"]
