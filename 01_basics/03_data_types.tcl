# ============================================================
# 03_data_types.tcl — TCL's type system
# ============================================================

# TCL stores everything as strings internally.
# "Types" are checked on demand via "string is".

set integer 42
set float   3.14
set string  "Hello"
set boolean 1        ;# 1 = true, 0 = false in boolean context

# "string is <type> <value>" returns 1 (true) or 0 (false)
puts "Integer: $integer  is_int=[string is integer $integer]"
puts "Float:   $float    is_dbl=[string is double  $float]"
puts "String:  $string   is_alp=[string is alpha   $string]"
puts "Boolean: $boolean  is_boo=[string is boolean $boolean]"

# A number like 42 satisfies both integer and double checks
puts "42 is integer: [string is integer 42]"
puts "42 is double:  [string is double  42]"
