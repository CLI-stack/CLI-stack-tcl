# ============================================================
# 02_regexp_capture.tcl — Extracting matched groups
# ============================================================

set line "ERROR 2024-01-15 Connection timeout"

# Parentheses ( ) create capture groups
# After "regexp pattern string ->", TCL fills variables for each group
# -> captures the entire match; subsequent vars capture each () group
regexp {(\w+)\s+(\d{4}-\d{2}-\d{2})\s+(.*)} $line -> level date msg
puts "Level: $level"   ;# ERROR
puts "Date:  $date"    ;# 2024-01-15
puts "Msg:   $msg"     ;# Connection timeout

# Capture four groups (IP address octets)
set ip "192.168.1.100"
regexp {(\d+)\.(\d+)\.(\d+)\.(\d+)} $ip -> a b c d
puts "IP: $a . $b . $c . $d"

# -all -inline: return ALL matches as a flat list
# Each match produces: whole_match group1 group2 ...
set text "name=Alice age=30 city=KL"
set hits [regexp -all -inline {(\w+)=(\w+)} $text]
puts "Pairs: $hits"

# Process the flat list: every 3 elements is {whole key value}
set d [dict create]
foreach {_ k v} $hits { dict set d $k $v }
puts "Dict: $d"
