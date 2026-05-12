# ============================================================
# 08_string_trim.tcl — Removing leading/trailing characters
# ============================================================

set s "   Hello, World!   "

# "string trim"      removes from both ends
# "string trimleft"  removes from the left (start) only
# "string trimright" removes from the right (end) only
# Default removes whitespace (spaces, tabs, newlines)
puts "|[string trim      $s]|"
puts "|[string trimleft  $s]|"
puts "|[string trimright $s]|"

# Second argument specifies which characters to trim (any char in the set)
set s2 "***Hello***"
puts [string trim      $s2 "*"]    ;# removes all leading and trailing *
puts [string trimleft  $s2 "*"]    ;# removes only leading *
puts [string trimright $s2 "*"]    ;# removes only trailing *

# Practical: skip comments and trim whitespace when reading config-like lines
set lines {"  key = value  " "  # comment" "  name=Alice  "}
foreach line $lines {
    set clean [string trim $line]
    # Skip lines that start with # after trimming
    if {[string index $clean 0] ne "#"} {
        puts "Config: $clean"
    }
}
