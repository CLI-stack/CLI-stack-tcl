# ============================================================
# 03_namespace_variable.tcl — Namespace as a simple module with state
# ============================================================

# This namespace acts like a singleton config store
# "variable data" holds shared state across all procs in the namespace
namespace eval Config {
    variable data [dict create]   ;# initialize with an empty dict

    # set: add or update a key-value pair in the config store
    proc set {key value} {
        variable data             ;# bind to the namespace-level "data" variable
        dict set data $key $value
    }

    # get: retrieve a value by key, returning "default" if missing
    proc get {key {default ""}} {
        variable data
        if {[dict exists $data $key]} { return [dict get $data $key] }
        return $default
    }

    # all: return the entire config dict for inspection
    proc all {} {
        variable data
        return $data
    }
}

# Use the module through its namespace path
Config::set host "localhost"
Config::set port 8080
Config::set debug 1

puts "host:    [Config::get host]"
puts "timeout: [Config::get timeout 30]"   ;# key missing → returns default 30
puts "all:     [Config::all]"
