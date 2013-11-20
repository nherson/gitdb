# ARGS:
#   $* => space-separated list of args to project out from each record
project() {
  records=$(< /dev/stdin)
  field_nums=$(echo $* | tr ' ' ',')
  echo $records | while read record; do
    echo $(echo $record | cut -f$field_nums -d',')
  done
}
