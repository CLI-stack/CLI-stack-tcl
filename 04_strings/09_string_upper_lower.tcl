# ============================================================
# 09_string_upper_lower.tcl — Case conversion
# ============================================================

set s "Hello, World!"

# "string toupper" converts every character to uppercase
puts [string toupper $s]

# "string tolower" converts every character to lowercase
puts [string tolower $s]

# Capitalize: uppercase the first character, keep the rest unchanged
# [string index str 0] gets the first char; [string range str 1 end] gets the rest
proc capitalize {str} {
    return [string toupper [string index $str 0]][string range $str 1 end]
}
puts [capitalize "hello"]
puts [capitalize "world"]

# Title case: capitalize every word in a string
# [split] splits into words, [lmap] transforms each, [join] puts them back
proc title_case {str} {
    set words [split $str " "]
    return [join [lmap w $words { capitalize $w }] " "]
}
puts [title_case "the quick brown fox"]

# Check if a string is already uppercase by comparing to its own uppercased version
set word "UPPER"
puts "Is upper: [string equal $word [string toupper $word]]"   ;# 1 = true
