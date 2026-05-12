# ============================================================
# 10_proc_introspection.tcl — Examining procedures at runtime
# ============================================================

proc add    {a b}           { return [expr {$a + $b}] }
proc greet  {name}          { puts "Hello, $name!" }
proc connect {host {port 80}} {}   ;# proc with a default argument

# [info procs pattern] returns a list of matching proc names
# If the list is non-empty, the proc exists
puts "add exists: [expr {[llength [info procs add]] > 0}]"

# [info args procname] returns the argument list of a proc
puts "Args of add:     [info args add]"
puts "Args of connect: [info args connect]"

# [info body procname] returns the body of a proc as a string
puts "Body of add:     [info body add]"

# [info default procname argname varname] checks for a default value
# Sets "dflt" to the default value and returns 1 if one exists
info default connect port dflt
puts "port default: $dflt"

# List all procs currently defined (sorted for readability)
puts "\nAll procs: [lsort [info procs]]"

# Dynamic dispatch: call a proc by name stored in a variable
set cmd "add"
puts "Dynamic call: [$cmd 5 3]"   ;# equivalent to [add 5 3]
