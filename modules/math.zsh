
fac() {
  typeset n=$1
  (( n < 2 )) && echo 1 && return
  echo $(( n * $(fac $((n-1))) ))
}


fib() {
    local n=$1
    local a=0
    local b=1
    local temp
    
    if [ $n -eq 0 ]; then
        echo 0
        return
    fi
    
    for (( i=2; i<=n; i++ )); do
        temp=$((a + b))
        a=$b
        b=$temp
    done
    
    echo $b
}

# Example fib
#for i in {0..10}; do;echo "$(fib $i)";done


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
    echo $((num/den))
}

nrform(){
    result=$(echo "$1" | bc -l)
    # printf "%'.0f\n" $result
    printf "%s\n" "$(LC_NUMERIC='de_DE.UTF-8' printf "%'.0f" "$result")"
}
