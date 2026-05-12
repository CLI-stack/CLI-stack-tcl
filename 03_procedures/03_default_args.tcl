# ============================================================
# 03_default_args.tcl — Optional arguments with default values
# ============================================================

# Arguments with defaults are specified as {argname defaultvalue}
# They must come AFTER required arguments
proc connect {host {port 8080} {timeout 30}} {
    puts "Connecting to $host:$port (timeout=${timeout}s)"
}

connect "localhost"              ;# uses defaults: port=8080, timeout=30
connect "myserver.com" 443      ;# overrides port, timeout stays default
connect "db.internal" 5432 60   ;# overrides both optional args

# Another example — default log level is INFO
proc log {msg {level "INFO"}} {
    puts "\[$level\] $msg"       ;# \[ and \] are literal brackets in output
}

log "Server started"             ;# level defaults to "INFO"
log "Disk full" "ERROR"          ;# override level to "ERROR"
log "Verbose detail" "DEBUG"     ;# override level to "DEBUG"
