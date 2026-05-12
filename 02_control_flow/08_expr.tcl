# ============================================================
# 08_expr.tcl — The expr command in depth
# ============================================================

set a 10
set b 4

# Arithmetic — always use { } around the expression for performance and safety
puts "Arithmetic: [expr {$a+$b}] [expr {$a-$b}] [expr {$a*$b}] [expr {$a/$b}]"

# Integer division truncates towards zero; use double() to force floating point
puts "Float div:  [expr {$a / double($b)}]"

# Comparison operators return 1 (true) or 0 (false)
puts "a>b=[expr {$a>$b}]  a==b=[expr {$a==$b}]  a!=b=[expr {$a!=$b}]"

# Logical operators
# && = AND, || = OR, ! = NOT
puts "AND=[expr {$a>5 && $b<10}]  OR=[expr {$a<5 || $b<10}]  NOT=[expr {!($a==$b)}]"

# Bitwise operators work on integers
puts "AND=[expr {$a & $b}]"    ;# bitwise AND
puts "OR =[expr {$a | $b}]"    ;# bitwise OR
puts "XOR=[expr {$a ^ $b}]"    ;# bitwise XOR
puts "SHL=[expr {$a << 2}]"    ;# shift left (multiply by 4)
puts "SHR=[expr {$a >> 1}]"    ;# shift right (divide by 2)

# Ternary operator: condition ? value_if_true : value_if_false
puts [expr {$a > $b ? "a wins" : "b wins"}]
