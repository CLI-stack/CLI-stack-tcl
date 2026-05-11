set defaults  [dict create timeout 30 retries 3 debug 0 host localhost]
set overrides [dict create host myserver.com debug 1 port 8080]

set config [dict merge $defaults $overrides]
puts "Merged:"
dict for {k v} $config { puts "  $k = $v" }

set a [dict create x 1 y 2]
set b [dict create y 20 z 3]
set c [dict create z 30 w 4]
puts "\nTriple merge: [dict merge $a $b $c]"

proc apply_overrides {base overrides} {
    return [dict merge $base $overrides]
}
puts "\nWith overrides: [apply_overrides $defaults {debug 1 timeout 60}]"
