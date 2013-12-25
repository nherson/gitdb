# Creates an empty table in the form of a flat file
# ARGS:
#   $1 => Name for the table (name of the flat file)
#   $2 => Schema for the table (name of each column)
create_table() {
  table_name=$1
  field_names=$2
  if table_exists $table_name; then
    return 1
  fi
  if invalid_table_name $table_name; then
    return 1
  fi
  echo "$table_name:$field_names" >> schema
  touch $table_name
}

# Drops the specified table (removes the file)
# ARGS:
#   $1 => The name of the table to drop
drop_table() {
  table_name=$1
  if not_table_exists $table_name; then
    return 1
  fi
  rm $table_name
  sed "/$table_name/d" schema > schema
}

# Inserts the given record into the specified table
# ARGS:
#   $1 => Name of the table to insert into
#   $2 => The record to insert (appended to bottom of table)
insert_record() {
  record=$2
  table_name=$1
  if not_table_exists $table_name; then
    return 1
  fi
  echo THERE SHOULD BE A RECORD SANITY CHECK
  echo $record >> $table_name
}

# Deletes every instance of the given record from the table
# ARGS:
#   $1 => Name of the table to delete from
#   $2 => The record to delete
delete_record() {
  record=$2
  table_name=$1
  if not_table_exists $table_name; then
    return 1
  fi
  sed -i "/$record/d" $table_name
}

# Displays the schema for every table in the DB
# NO_ARGS
schema() {
  echo "TABLE: FIELD NAMES (comma separated)"
  echo '------------------------------------'
  for table in $(find * -maxdepth 1 -type f -print); do
    echo "$table: $(cat $table | head -n 1)"
  done
}

