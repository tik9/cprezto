
fac() {
  typeset n=$1
  (( n < 2 )) && echo 1 && return
  echo $(( n * $(fac $((n-1))) ))
}


fib() {
if (( $1 <= 1 )); then
        echo 1
    else
        last=$(f $(( $1 - 1 )))
        echo $(( $1 * last ))
    fi
}

nChooseK() {
    num=1
    den=1

    if (( $2 < $1 - $2 )); then
        k=$2
    else
        k=$(( $1 - $2 ))
    fi

    for ((i = 1; i <= k; ++i)); do
        ((num *= $1 + 1 - i)) && ((den *= i))
    done
    echo $((num / den))
}

nrform(){
    result=$(echo "$1" | bc -l)
    # printf "%'.0f\n" $result
    printf "%s\n" "$(LC_NUMERIC='de_DE.UTF-8' printf "%'.0f" "$result")"
}
