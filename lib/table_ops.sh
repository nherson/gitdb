# Creates an empty table in the form of a flat file
# ARGS:
#   $1 => Name for the table (name of the flat file)
#   $2 => Schema for the table (name of each column)
create_table() {
  table_name=$1
  field_names=$2
  if [ -f "$table_name" ]; then
    echo there should be a table_already_exists_error
  fi
  echo $field_names > $table_name
  echo ======== >> $table_name
}

# Drops the specified table (removes the file)
# ARGS:
#   $1 => The name of the table to drop
drop_table() {
  table_name=$1
  if [[ ! -f "$table_name" ]]; then
    echo there should be a table_does_not_exist_error
  fi
  rm $table_name
}

# Inserts the given record into the specified table
# ARGS:
#   $1 => Name of the table to insert into
#   $2 => The record to insert (appended to bottom of table)
insert_record() {
  record=$2
  table_name=$1
  if [[ ! -f "$table_name" ]]; then
    echo there should be a table_does_not_exist_error
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
  if [[ ! -f "$table_name" ]]; then
    echo there should be a table_does_not_exist_error
  fi
  sed -i "/$record/d" $table_name
}

# Displays the schema for every table in the DB
# NO_ARGS
schema() {
  echo "TABLE: FIELD NAMES (comma separated)"
  echo '------------------------------------'
  for table in $(find * -maxdepth 1 -type f -print); do
    echo -n "$table: $(cat $table | head -n 1)"
  done
}

table_exists() {
  table=$1
  if [ -f $table ]; then
    return 0
  else
    return 1
  fi
}

not_table_exists() {
  table=$1
  if [ -f $table ]; then
    return 1
  else
    return 0
  fi
}
