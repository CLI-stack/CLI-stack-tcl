# ============================================================
# 04_llength_lsearch.tcl — List length and searching
# ============================================================

set lst {banana apple cherry date elderberry apple}

# "llength" returns the number of elements in a list
puts "Length: [llength $lst]"

# "lsearch" returns the INDEX of the first matching element, or -1 if not found
puts "First apple:  [lsearch $lst apple]"    ;# 1
puts "Not found:    [lsearch $lst mango]"    ;# -1

# -all returns a list of ALL matching indices (not just the first)
puts "All apples:   [lsearch -all $lst apple]"

# -glob uses shell glob patterns (* ? [])
puts "Glob *erry:   [lsearch -glob $lst *erry]"

# -regexp uses regular expression patterns
puts "Regexp vowel-start: [lsearch -regexp $lst {^[aeiou]}]"

# -inline returns the matching ELEMENT instead of its index
puts "Match inline: [lsearch -inline $lst *erry]"

# Combine -all and -inline to get ALL matching elements (like grep)
puts "All *a*:      [lsearch -all -inline $lst *a*]"

# -start n begins searching from index n
puts "apple after 2: [lsearch -start 2 $lst apple]"
