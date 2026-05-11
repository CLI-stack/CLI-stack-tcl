foreach path [list /tmp /etc/hostname /nonexistent /etc/hosts] {
    if {[file exists $path]} {
        if {[file isdirectory $path]} {
            puts "$path: directory"
        } elseif {[file isfile $path]} {
            puts "$path: file ([file size $path] bytes)"
        }
    } else {
        puts "$path: does not exist"
    }
}

puts "\n/tmp access:"
puts "  readable:   [file readable   /tmp]"
puts "  writable:   [file writable   /tmp]"
puts "  executable: [file executable /tmp]"
