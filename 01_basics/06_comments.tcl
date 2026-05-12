# ============================================================
# 06_comments.tcl — How to write comments in TCL
# ============================================================

# A line starting with # is a single-line comment
# The # must be at the start of a command position (after newline or semicolon)

set x 10  ;# inline comment: semicolon ends the command, then # starts comment

# TCL has no built-in multi-line comment syntax.
# The common workaround is "if 0 { ... }" — the block is never executed,
# so anything inside is effectively a comment.
if 0 {
    This entire block is skipped at runtime.
    set y 20
    puts "this never runs"
}

puts "x = $x"
