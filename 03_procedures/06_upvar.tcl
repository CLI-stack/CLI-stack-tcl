proc double_it {varname} {
    upvar 1 $varname var
    set var [expr {$var * 2}]
}
set x 5
double_it x
puts "x after double: $x"   ;# 10

proc fill_array {arrname} {
    upvar 1 $arrname arr
    set arr(a) 1
    set arr(b) 2
    set arr(c) 3
}
fill_array myarr
puts "myarr: [array get myarr]"

proc swap {va vb} {
    upvar 1 $va a $vb b
    set tmp $a; set a $b; set b $tmp
}
set p 100; set q 200
swap p q
puts "p=$p  q=$q"   ;# p=200 q=100
