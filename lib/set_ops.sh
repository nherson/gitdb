# Union of 2 relations
# ARGS: 
#   $1 => A long string of records
#   $2 => another long string of records
union() {
  comm <(sort <(echo $1)) <(sort <(echo $2)) | tr -d '\t'
}

# Intersection of 2 relations
# ARGS:
#   $1 and $2 => relations, as strings
intersect() {
  comm -12 <(sort <(echo $1)) <(sort <(echo $2)) | tr -d '\t'
}

# Relation 1 minus Relation 2
# ARGS:
#   $1 and $2 => relations, as strings
except() {
  comm -23 <(sort <(echo $1)) <(sort <(echo $2)) | tr -d '\t'
}
