set text "Score: 95, Grade: A+, Points: 150, Bonus: 25"

set numbers [regexp -all -inline {\d+} $text]
puts "Numbers: $numbers"

set words [regexp -all -inline {[A-Za-z]+} $text]
puts "Words:   $words"

set config "host=localhost port=8080 debug=true"
set pairs  [regexp -all -inline {(\w+)=(\w+)} $config]
puts "Pairs:   $pairs"

set d [dict create]
foreach {_ k v} $pairs { dict set d $k $v }
puts "Dict:    $d"
puts "Port:    [dict get $d port]"
