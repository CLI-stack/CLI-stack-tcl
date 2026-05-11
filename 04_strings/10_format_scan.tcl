puts [format "%-10s %5d %8.2f" "Alice" 30 95.5]
puts [format "%-10s %5d %8.2f" "Bob"   25 87.3]

for {set i 1} {$i <= 5} {incr i} {
    puts [format "%3d: %s" $i [string repeat "*" $i]]
}

# scan — parse formatted input
set line "Alice 30 95.5"
scan $line "%s %d %f" name age score
puts "Name=$name  Age=$age  Score=$score"

set data "X=42 Y=100"
scan $data "X=%d Y=%d" x y
puts "x=$x  y=$y"
