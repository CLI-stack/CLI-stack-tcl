# ============================================================
# 01_string_length.tcl — Measuring string length
# ============================================================

set s "Hello, TCL World!"
puts "String: $s"

# "string length" returns the number of characters (not bytes)
puts "Length: [string length $s]"

# Empty string and single space
puts "Empty:  [string length {}]"    ;# {} is an empty string → 0
puts "Space:  [string length { }]"   ;# a single space → 1

# TCL handles Unicode — each character counts as 1 regardless of byte size
set u "日本語"
puts "\nUnicode: $u"
puts "Char length: [string length $u]"   ;# 3 characters
