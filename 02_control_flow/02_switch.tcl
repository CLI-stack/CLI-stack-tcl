set day "Monday"
switch $day {
    "Monday"             { puts "Start of work week" }
    "Friday"             { puts "End of work week" }
    "Saturday" - "Sunday" { puts "Weekend!" }
    default              { puts "Midweek: $day" }
}

# Glob-style matching
set filename "report.txt"
switch -glob $filename {
    "*.txt" { puts "Text file" }
    "*.tcl" { puts "TCL script" }
    "*.log" { puts "Log file" }
    default { puts "Unknown type" }
}

# Regexp-style matching
set input "abc123"
switch -regexp $input {
    {^\d+$}    { puts "All digits" }
    {^[a-z]+$} { puts "All lowercase" }
    {^[a-z0-9]+$} { puts "Alphanumeric" }
    default    { puts "Other" }
}
