namespace eval Config {
    variable data [dict create]

    proc set {key value} {
        variable data
        dict set data $key $value
    }

    proc get {key {default ""}} {
        variable data
        if {[dict exists $data $key]} { return [dict get $data $key] }
        return $default
    }

    proc all {} {
        variable data
        return $data
    }
}

Config::set host "localhost"
Config::set port 8080
Config::set debug 1

puts "host:    [Config::get host]"
puts "timeout: [Config::get timeout 30]"
puts "all:     [Config::all]"
