# ============================================================
# 02_switch.tcl — Multi-way branching with switch
# ============================================================

set day "Monday"

# Basic switch — compares value against each pattern string
# The "-" after "Saturday" means fall-through to the next body
switch $day {
    "Monday"              { puts "Start of work week" }
    "Friday"              { puts "End of work week" }
    "Saturday" - "Sunday" { puts "Weekend!" }
    default               { puts "Midweek: $day" }
}

# -glob flag: use shell-style glob patterns (* matches any chars, ? matches one)
set filename "report.txt"
switch -glob $filename {
    "*.txt" { puts "Text file" }
    "*.tcl" { puts "TCL script" }
    "*.log" { puts "Log file" }
    default { puts "Unknown type" }
}

# -regexp flag: use regular expression patterns for matching
set input "abc123"
switch -regexp $input {
    {^\d+$}       { puts "All digits" }
    {^[a-z]+$}    { puts "All lowercase" }
    {^[a-z0-9]+$} { puts "Alphanumeric" }
    default       { puts "Other" }
}
