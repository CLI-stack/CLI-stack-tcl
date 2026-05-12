# ============================================================
# 10_file_dir_ops.tcl — Directory creation and management
# ============================================================

set d "/tmp/tcl_dir_demo"

# "file mkdir" creates a directory (and all missing parent directories)
# It's like "mkdir -p" in shell
file mkdir "$d/sub1/sub2"
puts "Created: [file isdirectory $d]"         ;# 1 = exists as directory
puts "Nested:  [file isdirectory $d/sub1/sub2]"  ;# 1

# Create some files inside the directory
foreach name {a.txt b.txt c.log} {
    set fh [open "$d/$name" w]
    puts $fh "content"
    close $fh
}

# List directory contents using glob
puts "\nContents:"
foreach f [lsort [glob -nocomplain "$d/*"]] {
    # "file tail" strips the directory prefix; "file type" tells us what it is
    puts "  [file tail $f] ([file type $f])"
}

# Count specific file types
set txts [glob -nocomplain "$d/*.txt"]
puts "\n.txt count: [llength $txts]"

# "file delete -force" removes a directory and all its contents recursively
file delete -force $d
puts "Cleaned up: [expr {![file exists $d]}]"   ;# 1 = successfully deleted
