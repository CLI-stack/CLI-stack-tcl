# ============================================================
# 08_file_info.tcl — Querying file metadata and path manipulation
# ============================================================

set f "/etc/hostname"
if {[file exists $f]} {
    puts "File:      $f"
    puts "Size:      [file size $f] bytes"        ;# size in bytes
    puts "Readable:  [file readable $f]"           ;# access permission check
    puts "Type:      [file type $f]"               ;# file, directory, link, etc.
    puts "Extension: [file extension $f]"          ;# e.g. ".txt" (empty here)
    puts "Tail:      [file tail $f]"               ;# filename without directory
    puts "Dir:       [file dirname $f]"            ;# directory portion only
    # "file mtime" returns the modification time as a Unix timestamp
    puts "Modified:  [clock format [file mtime $f] -format {%Y-%m-%d %H:%M:%S}]"
}

# Path manipulation commands — work on strings, no filesystem access needed
set path "/home/user/docs/report.txt"
puts "\nPath parts:"
puts "  dirname:   [file dirname   $path]"    ;# /home/user/docs
puts "  tail:      [file tail      $path]"    ;# report.txt
puts "  rootname:  [file rootname  $path]"    ;# /home/user/docs/report
puts "  extension: [file extension $path]"    ;# .txt
puts "  joined:    [file join /home user docs report.txt]"   ;# platform-safe join
puts "  normalized:[file normalize /tmp/../etc/hostname]"    ;# resolve .. and symlinks
