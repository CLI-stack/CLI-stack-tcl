proc add    {a b}       { return [expr {$a + $b}] }
proc greet  {name}      { puts "Hello, $name!" }
proc connect {host {port 80}} {}

puts "add exists: [expr {[llength [info procs add]] > 0}]"
puts "Args of add:     [info args add]"
puts "Args of connect: [info args connect]"
puts "Body of add:     [info body add]"

info default connect port dflt
puts "port default: $dflt"

puts "\nAll procs: [lsort [info procs]]"

# Dynamic dispatch
set cmd "add"
puts "Dynamic call: [$cmd 5 3]"
