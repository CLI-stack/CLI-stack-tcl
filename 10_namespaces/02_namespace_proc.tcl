namespace eval Logger {
    variable prefix "\[LOG\]"

    proc info {msg} {
        variable prefix
        puts "$prefix INFO:  $msg"
    }

    proc warn {msg} {
        variable prefix
        puts "$prefix WARN:  $msg"
    }

    proc error {msg} {
        variable prefix
        puts "$prefix ERROR: $msg"
    }
}

Logger::info  "Application started"
Logger::warn  "Low memory"
Logger::error "Connection failed"
