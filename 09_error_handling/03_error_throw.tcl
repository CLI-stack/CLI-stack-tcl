proc validate_age {age} {
    if {![string is integer $age]} {
        error "Age must be integer, got: $age"
    }
    if {$age < 0 || $age > 150} {
        error "Age out of range: $age"
    }
    return $age
}

foreach test {25 -5 abc 200} {
    if {[catch {validate_age $test} result]} {
        puts "Invalid '$test': $result"
    } else {
        puts "Valid: $result"
    }
}

# Error with explicit error code
proc open_config {path} {
    if {![file exists $path]} {
        error "Config not found: $path" {} {CONFIG NOTFOUND}
    }
}
catch {open_config /no.cfg} err opts
puts "\nCode: [dict get $opts -errorcode]"
puts "Msg:  $err"
