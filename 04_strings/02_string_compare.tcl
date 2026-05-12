# ============================================================
# 02_string_compare.tcl — Comparing strings
# ============================================================

set a "apple"
set b "banana"

# "string compare" returns: -1 if a<b, 0 if equal, 1 if a>b
# Comparison is lexicographic (dictionary order) by default
puts "compare apple banana: [string compare $a $b]"   ;# -1 (a comes before b)
puts "compare banana apple: [string compare $b $a]"   ;#  1
puts "compare apple apple:  [string compare $a $a]"   ;#  0 (equal)

# "string equal" returns 1 (equal) or 0 (not equal)
puts "equal: [string equal $a $b]"
# -nocase makes comparison case-insensitive
puts "equal nocase: [string equal -nocase TCL tcl]"   ;# 1

# lsort with default settings sorts strings alphabetically
set words {banana apple cherry date elderberry}
puts "Alpha sort: [lsort $words]"

# -dictionary sort handles embedded numbers naturally (file2 before file10)
set files {file10 file2 file1 file20}
puts "Dict sort:  [lsort -dictionary $files]"   ;# file1 file2 file10 file20
