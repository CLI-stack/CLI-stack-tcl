namespace eval StringUtils {
    namespace export *
    proc upper   {s} { string toupper $s }
    proc lower   {s} { string tolower $s }
    proc reverse {s} { string reverse $s }
    proc trimws  {s} { string trim    $s }
}

# Import specific
namespace import StringUtils::upper StringUtils::lower
puts [upper "hello"]
puts [lower "WORLD"]

# Import all (force to override already-imported names)
namespace import -force StringUtils::*
puts [reverse "hello"]
puts [trimws  "  spaces  "]

# Forget one
namespace forget StringUtils::upper

# Still callable by full path
puts [StringUtils::upper "direct"]
