# ============================================================
# 07_dict_merge.tcl — Merging dictionaries
# ============================================================

set defaults  [dict create timeout 30 retries 3 debug 0 host localhost]
set overrides [dict create host myserver.com debug 1 port 8080]

# "dict merge d1 d2 ..." merges all dicts left to right
# Later dicts win on key conflicts — perfect for default+override pattern
set config [dict merge $defaults $overrides]
puts "Merged:"
dict for {k v} $config { puts "  $k = $v" }

# Merge three dicts — rightmost values take precedence
set a [dict create x 1 y 2]
set b [dict create y 20 z 3]    ;# y from b overrides y from a
set c [dict create z 30 w 4]    ;# z from c overrides z from b
puts "\nTriple merge: [dict merge $a $b $c]"

# Pattern: apply selective overrides to a base config
proc apply_overrides {base overrides} {
    return [dict merge $base $overrides]
}
puts "\nWith overrides: [apply_overrides $defaults {debug 1 timeout 60}]"
