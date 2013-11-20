# A simple read over an entire table
# ARGS:
#   $1 => the filename containing a table
scan() {
  table=$1
  cat $table
}
