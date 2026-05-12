# ============================================================
# 02_namespace_proc.tcl — Procs and state inside namespaces
# ============================================================

# A Logger namespace encapsulates all logging functionality
namespace eval Logger {
    variable prefix "\[LOG\]"   ;# shared state for all procs in this namespace

    # Each proc must declare "variable" to access namespace-level variables
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

# Use :: to call procs in the Logger namespace
Logger::info  "Application started"
Logger::warn  "Low memory"
Logger::error "Connection failed"
