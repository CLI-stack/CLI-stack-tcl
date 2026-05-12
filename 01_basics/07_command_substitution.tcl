# ============================================================
# 07_command_substitution.tcl — Using [ ] to embed commands
# ============================================================

# Command substitution: [ ] runs the inner command and replaces
# itself with the result before the outer command executes

# [clock seconds] returns the current Unix timestamp (integer)
# [clock format] converts a timestamp to a human-readable string
set date  [clock format [clock seconds] -format "%Y-%m-%d"]

# [string toupper] converts the string to uppercase
set upper [string toupper "hello world"]

# Nested substitution: inner command runs first
# [string trim] removes leading/trailing whitespace, then [string length] counts
set len   [string length [string trim "  hello  "]]

puts "Date:    $date"
puts "Upper:   $upper"
puts "Trimmed length: $len"

# Command substitution can appear anywhere in a string
puts "There are [llength {a b c d e}] items"   ;# [llength] counts list elements
