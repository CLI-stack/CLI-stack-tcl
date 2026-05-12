# ============================================================
# 10_loop_collections.tcl — Looping over lists, arrays, and dicts
# ============================================================

# --- List iteration ---
set mylist {10 20 30 40 50}
set sum 0
foreach val $mylist { incr sum $val }   ;# accumulate sum
puts "List sum: $sum"

# --- Array iteration ---
# Arrays are accessed by key; [array names] returns all keys
array set scores {math 90 science 85 english 92}
puts "\nArray:"
foreach key [lsort [array names scores]] {   ;# lsort sorts keys alphabetically
    puts "  $key: $scores($key)"
}

# --- Dict iteration ---
# "dict for" is the cleanest way to iterate key-value pairs in a dict
set config [dict create host localhost port 8080 debug 1]
puts "\nDict:"
dict for {k v} $config { puts "  $k = $v" }

# --- String character iteration ---
# [split str ""] splits a string into a list of individual characters
puts "\nChar loop:"
foreach ch [split "TCL" ""] { puts -nonewline "$ch-" }
puts ""
