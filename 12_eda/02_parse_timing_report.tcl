# ============================================================
# 02_parse_timing_report.tcl — Parse a PrimeTime-style timing report
# ============================================================

# Sample timing report (normally read from a file)
set sample_report {
Startpoint: clk_reg (rising edge-triggered flip-flop clocked by CLK)
Endpoint: data_reg (rising edge-triggered flip-flop clocked by CLK)
Path Group: CLK
Path Type: max

  Point                    Incr     Path
-------------------------------------------
  clock CLK (rise edge)   0.00     0.00
  clk_reg/CK              0.10     0.10
  clk_reg/Q               0.25     0.35
  data_reg/D              0.00     0.35
  data required time               0.80
-------------------------------------------
  slack (MET)                      0.30
}

# Extract the slack value and its status (MET or VIOLATED)
proc parse_slack {report} {
    # "slack (MET) 0.30" or "slack (VIOLATED) -0.05"
    if {[regexp {slack\s+\((\w+)\)\s+([-\d.]+)} $report -> status slack]} {
        return [dict create status $status slack $slack]
    }
    return [dict create status UNKNOWN slack 0]
}

# Extract path metadata from the report header
proc parse_endpoints {report} {
    regexp {Startpoint:\s+(\S+)} $report -> start
    regexp {Endpoint:\s+(\S+)}   $report -> end_pt
    regexp {Path Type:\s+(\w+)}  $report -> type
    return [dict create start $start end $end_pt type $type]
}

set timing [parse_slack $sample_report]
puts "Status: [dict get $timing status]  Slack: [dict get $timing slack]"

set path [parse_endpoints $sample_report]
puts "Start=[dict get $path start]  End=[dict get $path end]  Type=[dict get $path type]"
