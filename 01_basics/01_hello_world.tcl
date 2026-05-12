# ============================================================
# 01_hello_world.tcl — The simplest TCL script
# ============================================================

# "puts" prints a string followed by a newline to stdout
puts "Hello, World!"

# [info tclversion] returns the TCL interpreter version as a string
# Square brackets [ ] perform command substitution — the inner command
# runs first and its result is substituted into the outer string
puts "TCL version: [info tclversion]"

# [info script] returns the filename of the currently running script
puts "Script: [info script]"
