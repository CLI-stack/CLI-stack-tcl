# Single-line comment

set x 10  ;# inline comment after semicolon

# Multi-line comment idiom — use "if 0"
if 0 {
    This block is never executed.
    set y 20
    puts "this never runs"
}

puts "x = $x"
