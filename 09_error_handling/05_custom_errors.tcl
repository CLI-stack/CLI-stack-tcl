namespace eval MyApp {
    proc throw {category msg} {
        error $msg {} [list MYAPP $category]
    }
}

proc validate_input {input} {
    if {$input eq ""} {
        MyApp::throw VALIDATION "Input cannot be empty"
    }
    if {![string is integer $input]} {
        MyApp::throw VALIDATION "Must be numeric: $input"
    }
    if {$input < 0} {
        MyApp::throw RANGE "Must be positive: $input"
    }
    return $input
}

foreach test {"" "abc" "-5" "42"} {
    try {
        puts "OK: [validate_input $test]"
    } trap {MYAPP VALIDATION} {err} {
        puts "Validation: $err"
    } trap {MYAPP RANGE} {err} {
        puts "Range: $err"
    } on error {err} {
        puts "Unknown: $err"
    }
}
