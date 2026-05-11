set lst {banana apple cherry date elderberry apple}

puts "Length: [llength $lst]"
puts "First apple:  [lsearch $lst apple]"
puts "Not found:    [lsearch $lst mango]"

puts "All apples:   [lsearch -all $lst apple]"
puts "Glob *erry:   [lsearch -glob $lst *erry]"
puts "Regexp vowel-start: [lsearch -regexp $lst {^[aeiou]}]"

puts "Match inline: [lsearch -inline $lst *erry]"
puts "All *a*:      [lsearch -all -inline $lst *a*]"

puts "apple after 2: [lsearch -start 2 $lst apple]"
