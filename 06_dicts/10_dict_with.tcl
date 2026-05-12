# ============================================================
# 10_dict_with.tcl — Direct access to dict keys as local variables
# ============================================================

set config [dict create host "localhost" port 8080 debug 1 maxconn 100]

# "dict with dictVar { body }" creates local variables for every key
# Inside the body, you can read dict values using their key names directly
dict with config {
    puts "Host: $host  Port: $port"
    puts "Debug: $debug  MaxConn: $maxconn"
}

# dict with also writes back: changes to local vars update the dict
set stats [dict create hits 0 misses 0 errors 0]
dict with stats {
    incr hits 10    ;# modifies stats["hits"]
    incr misses 3   ;# modifies stats["misses"]
    incr errors 1   ;# modifies stats["errors"]
}
puts "Stats: $stats"

# Practical: use dict with inside a proc for clean parameter access
proc show_connection {cfg} {
    dict with cfg {
        if {$debug} { puts "(DEBUG) $host:$port" }
        return "${host}:${port}"   ;# combine host and port into a URL string
    }
}
puts [show_connection $config]
