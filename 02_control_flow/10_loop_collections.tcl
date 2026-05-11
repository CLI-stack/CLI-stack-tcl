set mylist {10 20 30 40 50}
set sum 0
foreach val $mylist { incr sum $val }
puts "List sum: $sum"

array set scores {math 90 science 85 english 92}
puts "\nArray:"
foreach key [lsort [array names scores]] {
    puts "  $key: $scores($key)"
}

set config [dict create host localhost port 8080 debug 1]
puts "\nDict:"
dict for {k v} $config { puts "  $k = $v" }

puts "\nChar loop:"
foreach ch [split "TCL" ""] { puts -nonewline "$ch-" }
puts ""
