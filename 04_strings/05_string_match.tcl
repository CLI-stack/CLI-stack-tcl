puts [string match "*.tcl"   "script.tcl"]   ;# 1
puts [string match "*.tcl"   "script.py"]    ;# 0
puts [string match "file?"   "file1"]        ;# 1
puts [string match "file?"   "file12"]       ;# 0
puts [string match "f*l*"    "final"]        ;# 1
puts [string match -nocase "hello" "HELLO"]  ;# 1

# Filter list by glob
set files {main.tcl utils.tcl README.md data.csv test.tcl}
set tcl_files [lsearch -all -inline $files "*.tcl"]
puts "TCL files: $tcl_files"

# Character classes
puts [string match {[aeiou]*} "apple"]    ;# vowel start
puts [string match {[aeiou]*} "banana"]   ;# consonant start
