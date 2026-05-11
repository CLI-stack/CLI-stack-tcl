namespace eval Stack {
    variable items {}

    proc push {item} {
        variable items
        lappend items $item
    }

    proc pop {} {
        variable items
        if {[llength $items] == 0} { error "Stack underflow" }
        set top [lindex $items end]
        set items [lrange $items 0 end-1]
        return $top
    }

    proc peek {} { variable items; lindex $items end }
    proc size {} { variable items; llength $items }

    namespace export push pop peek size
    namespace ensemble create
}

Stack push "first"
Stack push "second"
Stack push "third"
puts "Size: [Stack size]"
puts "Peek: [Stack peek]"
puts "Pop:  [Stack pop]"
puts "Pop:  [Stack pop]"
puts "Size: [Stack size]"
