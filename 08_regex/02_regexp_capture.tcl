set line "ERROR 2024-01-15 Connection timeout"

regexp {(\w+)\s+(\d{4}-\d{2}-\d{2})\s+(.*)} $line -> level date msg
puts "Level: $level"
puts "Date:  $date"
puts "Msg:   $msg"

# IP parts
set ip "192.168.1.100"
regexp {(\d+)\.(\d+)\.(\d+)\.(\d+)} $ip -> a b c d
puts "IP: $a . $b . $c . $d"

# All key=value pairs
set text "name=Alice age=30 city=KL"
set hits [regexp -all -inline {(\w+)=(\w+)} $text]
puts "Pairs: $hits"

set d [dict create]
foreach {whole k v} $hits { dict set d $k $v }
puts "Dict: $d"
