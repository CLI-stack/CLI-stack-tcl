set html "<a>link1</a> <a>link2</a>"
set greedy    [regexp -all -inline {<a>.*</a>}  $html]
set nongreedy [regexp -all -inline {<a>.*?</a>} $html]
puts "Greedy:     $greedy"
puts "Non-greedy: $nongreedy"

# Extract numbers before "px"
set css "margin: 10px padding: 20px font: 14px"
set px [regexp -all -inline {\d+(?=px)} $css]
puts "Pixel values: $px"

# Case-insensitive
regexp -nocase {hello} "HELLO WORLD" m
puts "CI match: $m"

# Parse log line
set log {2024-01-15 14:30:22 ERROR server.tcl:42 Connection failed}
regexp {^(\S+)\s+(\S+)\s+(\w+)\s+(\S+)\s+(.+)$} $log -> date time lvl src msg
puts "Date=$date Level=$lvl Source=$src"
puts "Msg=$msg"
