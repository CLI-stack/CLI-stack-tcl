set tcl_tmp [glob -nocomplain /tmp/*.tcl]
puts "TCL in /tmp: $tcl_tmp"

set all_here [glob -nocomplain *]
puts "Here: $all_here"

set only_files [glob -nocomplain -type f *]
set only_dirs  [glob -nocomplain -type d *]
puts "Files: $only_files"
puts "Dirs:  $only_dirs"

set confs [glob -nocomplain -directory /etc *.conf]
puts "/etc/*.conf count: [llength $confs]"
