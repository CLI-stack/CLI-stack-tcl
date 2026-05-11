set d1 [dict create name Alice age 30 city "KL"]
puts "d1: $d1"

set d2 {name Bob age 25 city Penang}
puts "d2 size: [dict size $d2]"

set empty [dict create]
puts "Empty size: [dict size $empty]"

set config [dict create]
dict set config host localhost
dict set config port 5432
dict set config db   myapp
puts "Config: $config"
