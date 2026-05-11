regsub {World} "Hello World" "TCL" result
puts $result

regsub -all {aaa} "aaa bbb aaa ccc aaa" "XXX" result
puts $result

# Strip HTML tags
regsub -all {<[^>]+>} "<b>Hello</b> <i>World</i>" "" plain
puts "Plain: $plain"

# Normalize whitespace
regsub -all {\s+} [string trim "  hello    world  "] " " clean
puts "Clean: '$clean'"

# Reorder date YYYY-MM-DD -> DD/MM/YYYY
regsub {(\d{4})-(\d{2})-(\d{2})} "2024-01-15" {\3/\2/\1} rearranged
puts "Rearranged: $rearranged"
