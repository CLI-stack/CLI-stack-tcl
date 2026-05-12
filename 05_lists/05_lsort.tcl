# ============================================================
# 05_lsort.tcl — Sorting lists
# ============================================================

set words {banana apple cherry date elderberry}
set nums  {5 2 8 1 9 3 7}

# Default: alphabetical (ASCII) sort
puts "Alpha:   [lsort $words]"

# -integer: sort as integers (not strings — avoids "10" < "9" problem)
puts "Integer: [lsort -integer $nums]"

# -real: sort as floating-point numbers
puts "Real:    [lsort -real {3.14 1.41 2.71 0.57}]"

# -decreasing: reverse the sort order
puts "Reverse: [lsort -decreasing $words]"
puts "Rev int: [lsort -integer -decreasing $nums]"

# -dictionary: natural sort — handles embedded numbers sensibly
set files {file10 file2 file1 file20 file3}
puts "Dict:    [lsort -dictionary $files]"   ;# file1 file2 file3 file10 file20

# -index n: sort sublists by the element at position n
set data {{Bob 30} {Alice 25} {Carol 35}}
puts "By name: [lsort -index 0 $data]"           ;# sort by first field (name)
puts "By age:  [lsort -index 1 -integer $data]"  ;# sort by second field (age)

# -unique: remove duplicate elements (keeps only the first occurrence)
puts "Unique:  [lsort -unique {a b a c b d a}]"
