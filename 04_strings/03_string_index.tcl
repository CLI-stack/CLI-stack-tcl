# ============================================================
# 03_string_index.tcl — Accessing individual characters
# ============================================================

set s "Hello, World!"

# "string index str i" returns the character at position i (0-based)
puts "index 0:     [string index $s 0]"     ;# H — first character
puts "index 7:     [string index $s 7]"     ;# W
puts "index end:   [string index $s end]"   ;# ! — last character
puts "index end-1: [string index $s end-1]" ;# " — second to last

# "string first sub str" returns the index of the first occurrence
# Returns -1 if not found
puts "first 'l': [string first l $s]"       ;# 2
puts "first 'o': [string first o $s]"       ;# 4

# "string last sub str" returns the index of the LAST occurrence
puts "last  'l': [string last  l $s]"       ;# 10

# Third argument to "string first" specifies where to start searching
puts "find 'l' after 4: [string first l $s 4]"   ;# 10 (skips the earlier 'l's)
