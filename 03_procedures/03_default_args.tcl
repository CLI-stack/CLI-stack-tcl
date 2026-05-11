proc connect {host {port 8080} {timeout 30}} {
    puts "Connecting to $host:$port (timeout=${timeout}s)"
}

connect "localhost"
connect "myserver.com" 443
connect "db.internal" 5432 60

proc log {msg {level "INFO"}} {
    puts "\[$level\] $msg"
}

log "Server started"
log "Disk full" "ERROR"
log "Verbose detail" "DEBUG"
