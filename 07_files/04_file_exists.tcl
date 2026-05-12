# ============================================================
# 04_file_exists.tcl — Checking file/directory properties
# ============================================================

# Test various paths
foreach path [list /tmp /etc/hostname /nonexistent /etc/hosts] {
    # "file exists path" returns 1 if the path exists (any type)
    if {[file exists $path]} {
        # "file isdirectory" and "file isfile" distinguish type
        if {[file isdirectory $path]} {
            puts "$path: directory"
        } elseif {[file isfile $path]} {
            # "file size" returns the size in bytes
            puts "$path: file ([file size $path] bytes)"
        }
    } else {
        puts "$path: does not exist"
    }
}

# Permission checks — each returns 1 (yes) or 0 (no)
puts "\n/tmp access:"
puts "  readable:   [file readable   /tmp]"   ;# can we read from it?
puts "  writable:   [file writable   /tmp]"   ;# can we write to it?
puts "  executable: [file executable /tmp]"   ;# can we execute/traverse it?
