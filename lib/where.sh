# ARGS: 
#   $1 => the field number to test against
#   $2 => the value to compare the record's field against
#
# TODO: support more than just simple equality
where() {
  lines=$(< /dev/stdin)
  field_num=$1
  val=$2
  IFS=' '
  echo $lines | while read line; do
    field=$(echo $line | cut -f${field_num} -d',')
    if [[ "$field" == "$val" ]]; then
      echo $line
    fi
  done
}
