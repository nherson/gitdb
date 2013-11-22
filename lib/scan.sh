# A simple read over an entire table
# Important to use because it strips out the first two lines
# ARGS:
#   $1 => the filename containing a table
scan() {
  table=$1
  if not_table_exists $table; then
    return 1
  fi
  # don't print first two lines
  tail -n+3 $table
}
