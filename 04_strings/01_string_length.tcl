set s "Hello, TCL World!"
puts "String: $s"
puts "Length: [string length $s]"
puts "Empty:  [string length {}]"
puts "Space:  [string length { }]"

set u "日本語"
puts "\nUnicode: $u"
puts "Char length: [string length $u]"
