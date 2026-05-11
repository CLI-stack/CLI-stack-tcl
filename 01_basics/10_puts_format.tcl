set name  "Azman"
set score 95.5
set rank  1

puts [format "%-10s %6.2f  Rank: %d" $name $score $rank]
puts [format "Hex: 0x%X  Oct: 0%o" 255 255]
puts [format "Sci: %e" 123456.789]
puts [format "Padded: %010d" 42]

# puts to stderr
puts stderr "This goes to stderr"

# puts without newline
puts -nonewline "no newline "
puts "here"
