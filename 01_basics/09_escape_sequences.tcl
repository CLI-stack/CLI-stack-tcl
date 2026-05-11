puts "Tab:\there"
puts "Newline:\nnext line"
puts "Quote: \"quoted\""
puts "Backslash: \\"
puts "Unicode A: A"
puts "Hex 41: \x41"

# Curly braces suppress all substitution
puts {No escape: \n \t $var [command]}

# Backslash-newline joins lines
set long "first \
second \
third"
puts $long
