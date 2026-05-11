set str "Hello, World! 2024"

if {[regexp {World} $str]}   { puts "Found 'World'" }
if {[regexp {^\d+$} "12345"]} { puts "All digits" }
if {![regexp {^\d+$} "123a"]} { puts "Not all digits" }

set tests [dict create \
    email {^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$} \
    ip    {^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$} \
    date  {^\d{4}-\d{2}-\d{2}$} \
]
set samples [dict create email user@example.com ip 192.168.1.1 date 2024-01-15]

dict for {name pat} $tests {
    set s [dict get $samples $name]
    puts "$name '$s': [regexp $pat $s]"
}
