# ============================================================
# 05_string_match.tcl — Glob-style pattern matching
# ============================================================

# "string match pattern string" returns 1 if the string matches the glob pattern
# Glob wildcards: * = any sequence of chars, ? = exactly one char
puts [string match "*.tcl"   "script.tcl"]   ;# 1 — ends in .tcl
puts [string match "*.tcl"   "script.py"]    ;# 0 — does not end in .tcl
puts [string match "file?"   "file1"]        ;# 1 — ? matches exactly one char
puts [string match "file?"   "file12"]       ;# 0 — ? only matches one char
puts [string match "f*l*"    "final"]        ;# 1 — * matches zero or more chars
puts [string match -nocase "hello" "HELLO"]  ;# 1 — case-insensitive match

# Practical: filter a list to only items matching a pattern
# lsearch -all -inline returns ALL matching elements (not just indices)
set files {main.tcl utils.tcl README.md data.csv test.tcl}
set tcl_files [lsearch -all -inline $files "*.tcl"]
puts "TCL files: $tcl_files"

# Character class patterns: [abc] matches any one of a, b, or c
puts [string match {[aeiou]*} "apple"]    ;# 1 — starts with a vowel
puts [string match {[aeiou]*} "banana"]   ;# 0 — starts with a consonant
