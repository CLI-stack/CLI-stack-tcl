# ============================================================
# 05_custom_errors.tcl — Defining application-specific error types
# ============================================================

# Create a namespace to hold error-throwing helpers
namespace eval MyApp {
    # "throw" wraps "error" with a structured error code list
    # Code format: {MYAPP CATEGORY} — can be matched with "trap"
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
        # Only catches VALIDATION errors from MyApp
        puts "Validation: $err"
    } trap {MYAPP RANGE} {err} {
        # Only catches RANGE errors from MyApp
        puts "Range: $err"
    } on error {err} {
        # Fallback for anything else
        puts "Unknown: $err"
    }
}
