set d "/tmp/tcl_dir_demo"

file mkdir "$d/sub1/sub2"
puts "Created: [file isdirectory $d]"
puts "Nested:  [file isdirectory $d/sub1/sub2]"

foreach name {a.txt b.txt c.log} {
    set fh [open "$d/$name" w]
    puts $fh "content"
    close $fh
}

puts "\nContents:"
foreach f [lsort [glob -nocomplain "$d/*"]] {
    puts "  [file tail $f] ([file type $f])"
}

set txts [glob -nocomplain "$d/*.txt"]
puts "\n.txt count: [llength $txts]"

file delete -force $d
puts "Cleaned up: [expr {![file exists $d]}]"
