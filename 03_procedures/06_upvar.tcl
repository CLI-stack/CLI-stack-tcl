# ============================================================
# 06_upvar.tcl — Accessing caller's variables by reference
# ============================================================

# "upvar 1 remoteName localName" creates a link to the caller's variable
# Changes to the local alias modify the caller's original variable
proc double_it {varname} {
    upvar 1 $varname var    ;# "var" is now an alias for the caller's variable
    set var [expr {$var * 2}]
}
set x 5
double_it x
puts "x after double: $x"   ;# x was modified through the alias → 10

# upvar with arrays — pass an array by name and modify it
proc fill_array {arrname} {
    upvar 1 $arrname arr    ;# arr is now an alias for the caller's array
    set arr(a) 1
    set arr(b) 2
    set arr(c) 3
}
fill_array myarr
# [array get] returns all key-value pairs as a flat list
puts "myarr: [array get myarr]"

# Swap two variables using upvar
proc swap {va vb} {
    upvar 1 $va a $vb b   ;# two aliases at once
    set tmp $a; set a $b; set b $tmp
}
set p 100; set q 200
swap p q
puts "p=$p  q=$q"   ;# values were swapped → p=200 q=100
