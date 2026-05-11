set a "apple"
set b "banana"

puts "compare apple banana: [string compare $a $b]"   ;# -1
puts "compare banana apple: [string compare $b $a]"   ;#  1
puts "compare apple apple:  [string compare $a $a]"   ;#  0

puts "equal: [string equal $a $b]"
puts "equal nocase: [string equal -nocase TCL tcl]"

set words {banana apple cherry date elderberry}
puts "Alpha sort: [lsort $words]"

set files {file10 file2 file1 file20}
puts "Dict sort:  [lsort -dictionary $files]"
