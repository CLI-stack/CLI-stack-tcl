set a 10
set b 3

puts "Add:       [expr {$a + $b}]"
puts "Subtract:  [expr {$a - $b}]"
puts "Multiply:  [expr {$a * $b}]"
puts "Divide:    [expr {$a / $b}]"       ;# integer division
puts "Float div: [expr {$a / double($b)}]"
puts "Modulo:    [expr {$a % $b}]"
puts "Power:     [expr {$a ** $b}]"
puts "Abs:       [expr {abs(-15)}]"
puts "Max:       [expr {max($a, $b)}]"
puts "Min:       [expr {min($a, $b)}]"
puts "Sqrt:      [expr {sqrt($a)}]"
puts "Round:     [expr {round(3.7)}]"
puts "Floor:     [expr {floor(3.9)}]"
puts "Ceil:      [expr {ceil(3.1)}]"
