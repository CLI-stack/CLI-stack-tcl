# ============================================================
# 03_dict_exists.tcl — Safely checking for keys
# ============================================================

set config [dict create host localhost port 8080 debug 1]

# "dict exists dict key" returns 1 if key exists, 0 otherwise
# Always use this before "dict get" when the key might be missing
foreach key {host port debug timeout ssl} {
    if {[dict exists $config $key]} {
        puts "$key = [dict get $config $key]"
    } else {
        puts "$key: NOT SET"
    }
}

# Helper proc: get a value with a fallback default if key is missing
proc dict_getd {d key {default ""}} {
    if {[dict exists $d $key]} { return [dict get $d $key] }
    return $default
}

puts [dict_getd $config timeout 30]      ;# key missing → returns 30 (default)
puts [dict_getd $config host    "127.0.0.1"]  ;# key exists → returns "localhost"

# Nested dict: check multi-level path with multiple key arguments
set nested [dict create db [dict create host db.local port 5432]]
puts "db.host exists: [dict exists $nested db host]"   ;# 1
puts "db.pass exists: [dict exists $nested db pass]"   ;# 0
