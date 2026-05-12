# ============================================================
# 04_arithmetic.tcl — Math operations using expr
# ============================================================

# In TCL, math is NOT done inline — you must use "expr"
# Always wrap expr arguments in { } to avoid double substitution
set a 10
set b 3

puts "Add:       [expr {$a + $b}]"   ;# addition
puts "Subtract:  [expr {$a - $b}]"   ;# subtraction
puts "Multiply:  [expr {$a * $b}]"   ;# multiplication
puts "Divide:    [expr {$a / $b}]"   ;# integer division (truncates)
puts "Float div: [expr {$a / double($b)}]"  ;# force float division
puts "Modulo:    [expr {$a % $b}]"   ;# remainder
puts "Power:     [expr {$a ** $b}]"  ;# exponentiation

# Built-in math functions available inside expr
puts "Abs:   [expr {abs(-15)}]"      ;# absolute value
puts "Max:   [expr {max($a, $b)}]"   ;# maximum of two values
puts "Min:   [expr {min($a, $b)}]"   ;# minimum of two values
puts "Sqrt:  [expr {sqrt($a)}]"      ;# square root
puts "Round: [expr {round(3.7)}]"    ;# round to nearest integer
puts "Floor: [expr {floor(3.9)}]"    ;# round down
puts "Ceil:  [expr {ceil(3.1)}]"     ;# round up
