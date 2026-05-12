# ============================================================
# 02_catch_error_info.tcl — Inspecting error details
# ============================================================

# Define nested procs to generate a stack trace
proc inner {} { error "Something went wrong" }
proc outer {} { inner }

# Three-argument catch: catch script resultVar optionsVar
# optionsVar is a dict with -errorcode, -errorinfo, -level, etc.
set code [catch {outer} err opts]
puts "Return code:  $code"   ;# 1 = error
puts "Message:      $err"    ;# "Something went wrong"

# -errorcode: machine-readable error category (list form)
puts "Error code:   [dict get $opts -errorcode]"

# -errorinfo: the full stack trace as a multi-line string
puts "Stack trace:\n[dict get $opts -errorinfo]"

# Legacy approach (pre-TCL 8.5): use global variables
# errorInfo and errorCode are set by catch automatically
catch {outer} err2
global errorInfo errorCode
puts "\nerrorCode: $errorCode"
puts "errorInfo (first line): [lindex [split $errorInfo \n] 0]"
