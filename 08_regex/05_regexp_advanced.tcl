# ============================================================
# 05_regexp_advanced.tcl — Advanced regex techniques
# ============================================================

set html "<a>link1</a> <a>link2</a>"

# Greedy vs non-greedy matching:
# .* is greedy — matches as MUCH as possible (one long match)
# .*? is non-greedy — matches as LITTLE as possible (shortest match)
set greedy    [regexp -all -inline {<a>.*</a>}  $html]
set nongreedy [regexp -all -inline {<a>.*?</a>} $html]
puts "Greedy:     $greedy"      ;# one match: the whole string
puts "Non-greedy: $nongreedy"   ;# two matches: each <a>...</a>

# Lookahead (?=...) matches position before a pattern without consuming it
# This extracts numbers that are immediately followed by "px"
set css "margin: 10px padding: 20px font: 14px"
set px [regexp -all -inline {\d+(?=px)} $css]
puts "Pixel values: $px"   ;# 10 20 14

# Case-insensitive matching with -nocase flag
regexp -nocase {hello} "HELLO WORLD" m
puts "CI match: $m"   ;# HELLO

# Parse a structured log line using anchors and groups
set log {2024-01-15 14:30:22 ERROR server.tcl:42 Connection failed}
regexp {^(\S+)\s+(\S+)\s+(\w+)\s+(\S+)\s+(.+)$} $log -> date time lvl src msg
puts "Date=$date Level=$lvl Source=$src"
puts "Msg=$msg"
