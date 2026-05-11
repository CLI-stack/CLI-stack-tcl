set config [dict create host "localhost" port 8080 debug 1 maxconn 100]

dict with config {
    puts "Host: $host  Port: $port"
    puts "Debug: $debug  MaxConn: $maxconn"
}

# dict with can modify the dict
set stats [dict create hits 0 misses 0 errors 0]
dict with stats {
    incr hits 10
    incr misses 3
    incr errors 1
}
puts "Stats: $stats"

proc show_connection {cfg} {
    dict with cfg {
        if {$debug} { puts "(DEBUG) $host:$port" }
        return "${host}:${port}"
    }
}
puts [show_connection $config]
