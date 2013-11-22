# Throws an error if the table already exists
table_exists() {
  table=$1
  if [ -f $table ]; then
    echo "ERROR: table $table already exists"
    return 0
  else
    return 1
  fi
}

# Checks that the given table (file) does not exist
not_table_exists() {
  table=$1
  if [ ! -f $table ]; then
    echo "ERROR: table $table does not exist"
    return 0
  else
    return 1
  fi
}

# Checks that the given record has the proper number of fields
# ARGS:
#   $1 => record being checked
#   $2 => number of fields it should have
improper_num_fields() {
  num_fields=$(echo $1 | tr ',' ' ' | wc -w)
  if [ "$num_fields" = "$2" ]; then
    return 1
  else
    echo "ERROR: Improper number of fields for record"
    echo "Expected: $2"
    echo "Found: $num_fields"
    return 0
  fi
}

# Checks if the right number of arguments are passed to a call
# ARGS:
#   $1 => The args passed to a function
#   $2 => The number of args that _should_ be passed to the function
improper_num_args() {
    echo "nothing here"
}  

invalid_table_name() {
  table_name=$1
  if [ "$table_name" = "schema" ]; then
    echo "The name 'schema' is reserved for the schema file"
    return 0
  fi
  # no hidden-file table names
  if [[ ! "$table_name" == \.* ]]; then
    echo "Tables cannot start with a dot (.), else they'd be hidden files"
    return 0
  fi
  return 1
}


