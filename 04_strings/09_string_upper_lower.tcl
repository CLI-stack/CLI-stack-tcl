set s "Hello, World!"
puts [string toupper $s]
puts [string tolower $s]

proc capitalize {str} {
    return [string toupper [string index $str 0]][string range $str 1 end]
}
puts [capitalize "hello"]
puts [capitalize "world"]

proc title_case {str} {
    set words [split $str " "]
    return [join [lmap w $words { capitalize $w }] " "]
}
puts [title_case "the quick brown fox"]

set word "UPPER"
puts "Is upper: [string equal $word [string toupper $word]]"
