set a 10
set b 4

# Arithmetic
puts "Arithmetic: [expr {$a+$b}] [expr {$a-$b}] [expr {$a*$b}] [expr {$a/$b}]"
puts "Float div:  [expr {$a / double($b)}]"

# Comparison — returns 1 or 0
puts "a>b=[expr {$a>$b}]  a==b=[expr {$a==$b}]  a!=b=[expr {$a!=$b}]"

# Logical
puts "AND=[expr {$a>5 && $b<10}]  OR=[expr {$a<5 || $b<10}]  NOT=[expr {!($a==$b)}]"

# Bitwise
puts "AND=[expr {$a & $b}]  OR=[expr {$a | $b}]  XOR=[expr {$a ^ $b}]"
puts "SHL=[expr {$a << 2}]  SHR=[expr {$a >> 1}]"

# Ternary
puts [expr {$a > $b ? "a wins" : "b wins"}]
