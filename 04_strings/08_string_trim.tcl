set s "   Hello, World!   "
puts "|[string trim      $s]|"
puts "|[string trimleft  $s]|"
puts "|[string trimright $s]|"

set s2 "***Hello***"
puts [string trim      $s2 "*"]
puts [string trimleft  $s2 "*"]
puts [string trimright $s2 "*"]

# Practical: parse config lines
set lines {"  key = value  " "  # comment" "  name=Alice  "}
foreach line $lines {
    set clean [string trim $line]
    if {[string index $clean 0] ne "#"} {
        puts "Config: $clean"
    }
}
