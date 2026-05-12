# ============================================================
# 04_regexp_global.tcl — Finding all matches in a string
# ============================================================

set text "Score: 95, Grade: A+, Points: 150, Bonus: 25"

# -all -inline: find ALL non-overlapping matches and return them as a list
# \d+ matches one or more digit characters
set numbers [regexp -all -inline {\d+} $text]
puts "Numbers: $numbers"   ;# 95 150 25 (A+ contains no digits)

# Extract all words (sequences of letters)
set words [regexp -all -inline {[A-Za-z]+} $text]
puts "Words:   $words"

# Extract key=value pairs with capture groups
# Each match produces {whole_match key value}, so the list has groups of 3
set config "host=localhost port=8080 debug=true"
set pairs  [regexp -all -inline {(\w+)=(\w+)} $config]
puts "Pairs:   $pairs"

# Unpack into a dict: foreach with 3 vars consumes 3 elements per iteration
set d [dict create]
foreach {_ k v} $pairs { dict set d $k $v }
puts "Dict:    $d"
puts "Port:    [dict get $d port]"
