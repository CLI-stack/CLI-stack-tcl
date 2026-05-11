set config [dict create host localhost port 8080 debug 1]

foreach key {host port debug timeout ssl} {
    if {[dict exists $config $key]} {
        puts "$key = [dict get $config $key]"
    } else {
        puts "$key: NOT SET"
    }
}

proc dict_getd {d key {default ""}} {
    if {[dict exists $d $key]} { return [dict get $d $key] }
    return $default
}

puts [dict_getd $config timeout 30]
puts [dict_getd $config host    "127.0.0.1"]

# Nested exists
set nested [dict create db [dict create host db.local port 5432]]
puts "db.host exists: [dict exists $nested db host]"
puts "db.pass exists: [dict exists $nested db pass]"
