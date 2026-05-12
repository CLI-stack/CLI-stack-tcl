# ============================================================
# 04_namespace_import.tcl — Importing commands into current scope
# ============================================================

namespace eval StringUtils {
    # "namespace export" makes procs visible to callers using "namespace import"
    # Without this, import requests are silently ignored
    namespace export *

    proc upper   {s} { string toupper $s }
    proc lower   {s} { string tolower $s }
    proc reverse {s} { string reverse $s }
    proc trimws  {s} { string trim    $s }
}

# "namespace import" brings specific procs into the current namespace
# After import, you can call them WITHOUT the namespace:: prefix
namespace import StringUtils::upper StringUtils::lower
puts [upper "hello"]   ;# works without StringUtils:: prefix
puts [lower "WORLD"]

# -force overwrites existing imports (avoids "already exists" error)
namespace import -force StringUtils::*
puts [reverse "hello"]
puts [trimws  "  spaces  "]

# "namespace forget" removes a previously imported command
namespace forget StringUtils::upper

# After forgetting, must use the full qualified name again
puts [StringUtils::upper "direct"]
