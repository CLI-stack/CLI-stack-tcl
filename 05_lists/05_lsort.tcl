set words {banana apple cherry date elderberry}
set nums  {5 2 8 1 9 3 7}

puts "Alpha:   [lsort $words]"
puts "Integer: [lsort -integer $nums]"
puts "Real:    [lsort -real {3.14 1.41 2.71 0.57}]"
puts "Reverse: [lsort -decreasing $words]"
puts "Rev int: [lsort -integer -decreasing $nums]"

set files {file10 file2 file1 file20 file3}
puts "Dict:    [lsort -dictionary $files]"

set data {{Bob 30} {Alice 25} {Carol 35}}
puts "By name: [lsort -index 0 $data]"
puts "By age:  [lsort -index 1 -integer $data]"

puts "Unique:  [lsort -unique {a b a c b d a}]"
