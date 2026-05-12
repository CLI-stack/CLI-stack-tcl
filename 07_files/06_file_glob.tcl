# ============================================================
# 06_file_glob.tcl — Finding files with glob patterns
# ============================================================

# "glob ?options? pattern" returns a list of matching file paths
# -nocomplain suppresses the error when no files match (returns empty list)
set tcl_tmp [glob -nocomplain /tmp/*.tcl]
puts "TCL in /tmp: $tcl_tmp"

# Match all files in the current directory
set all_here [glob -nocomplain *]
puts "Here: $all_here"

# -type f limits matches to regular files only (excludes dirs, symlinks etc.)
# -type d limits matches to directories only
set only_files [glob -nocomplain -type f *]
set only_dirs  [glob -nocomplain -type d *]
puts "Files: $only_files"
puts "Dirs:  $only_dirs"

# -directory specifies which directory to search in
# Useful when you want to keep the pattern simple
set confs [glob -nocomplain -directory /etc *.conf]
puts "/etc/*.conf count: [llength $confs]"
