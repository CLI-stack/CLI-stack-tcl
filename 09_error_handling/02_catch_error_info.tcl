proc inner {} { error "Something went wrong" }
proc outer {} { inner }

set code [catch {outer} err opts]
puts "Return code:  $code"
puts "Message:      $err"
puts "Error code:   [dict get $opts -errorcode]"
puts "Stack trace:\n[dict get $opts -errorinfo]"

# Access global error vars (legacy style)
catch {outer} err2
global errorInfo errorCode
puts "\nerrorCode: $errorCode"
puts "errorInfo (first line): [lindex [split $errorInfo \n] 0]"
