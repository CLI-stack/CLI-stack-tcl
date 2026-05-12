# ============================================================
# 01_regexp_match.tcl — Testing strings against regex patterns
# ============================================================

set str "Hello, World! 2024"

# "regexp pattern string" returns 1 if pattern matches anywhere in string
# Curly braces { } prevent TCL from interpreting backslashes and brackets
if {[regexp {World} $str]}    { puts "Found 'World'" }

# ^ anchors to start, $ anchors to end
# \d matches any digit, + means one or more
if {[regexp {^\d+$} "12345"]} { puts "All digits" }
if {![regexp {^\d+$} "123a"]} { puts "Not all digits" }   ;# ! inverts the result

# Test common validation patterns against sample inputs
set tests [dict create \
    email {^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$} \
    ip    {^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$} \
    date  {^\d{4}-\d{2}-\d{2}$} \
]
set samples [dict create email user@example.com ip 192.168.1.1 date 2024-01-15]

dict for {name pat} $tests {
    set s [dict get $samples $name]
    puts "$name '$s': [regexp $pat $s]"   ;# 1 = valid, 0 = invalid
}
