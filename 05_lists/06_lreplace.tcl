# ============================================================
# 06_lreplace.tcl — Replacing or deleting list elements
# ============================================================

set lst {a b c d e f}

# "lreplace lst first last ?elem...?" replaces elements first..last with elems
# lreplace is non-destructive — it returns a new list
puts [lreplace $lst 2 2 X]        ;# replace index 2 (c) with X → a b X d e f
puts [lreplace $lst 1 3 X Y]      ;# replace indices 1-3 with X Y → a X Y e f
puts [lreplace $lst 2 2]          ;# omit replacement → deletes index 2 → a b d e f
puts [lreplace $lst end end Z]    ;# replace last element → a b c d e Z
puts [lreplace $lst 0 0 W X Y Z]  ;# replace first with multiple → W X Y Z b c d e f

# Original is NOT modified by lreplace
puts "Original unchanged: $lst"

# Must assign back to update the variable
set lst [lreplace $lst 0 0 "NEW"]
puts "Mutated: $lst"
