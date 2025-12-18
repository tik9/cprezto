
jq -r ".char" radiostations.json

jq -r 'to_entries[] | "\(.key) - \(.value)"' radiostations.json