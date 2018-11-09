#!/bin/bash

goal="ME THINKS IT IS LIKE A WEASEL"
str="KJFSA SDEFNWJANFL ASDFJQW FSP"
alphabet="ABCDEFGHIJKLMNOPQRSTUVWXYZ "

function make_individual {
    str=$1
    str_len=${#str}

    # zero-indexed (0-28)
    i=$((RANDOM * 29 / 32767))

    # calculate index
    new_char_i=$(($(printf '%d' "'${str:$i:1}")-65))
    if [ "${str:$i:1}" = " " ]; then new_char_i=26; fi

    # increment or decrement
    diff=1
    if [ $((RANDOM * 2 / 32767)) -eq 0 ]; then
	diff=-1
    fi
    new_char_i=$((new_char_i+diff))

    # handle overflow/underflow
    diff=0
    if [ $new_char_i -gt 26 ]; then
	diff=-27
    fi
    if [ $new_char_i -lt 0 ]; then
	diff=27
    fi
    new_char_i=$((new_char_i+diff))

    # get new character
    new_char="${alphabet:$new_char_i:1}"

    result="${str:0:$i}$new_char${str:$((i+1)):$((29-i))}"
}

function string_distance {
    s1=$1
    s2=$2
    l1=${#s1}
    l2=${#s2}

    # minimal length and length difference
    if [ $l1 -le $l2 ]; then
	len=$l1
	distance=$((l2-l1))
    else
	len=$l2
	distance=$((l1-l2))
    fi

    # calculate distance primitively
    for i in $(seq $len); do # 1-indexed
	c1=${s1:$((i-1)):1}
	c2=${s2:$((i-1)):1}

	v1=$(printf '%d' "'$c1")
	v2=$(printf '%d' "'$c2")

	vd=$((v1-v2))
	if [ $vd -lt 0 ]; then
	    vd=$((-vd))
	fi

	distance=$((distance+(vd*vd)))
    done

    echo $distance
}

function min {
    min=$1
    i=0
    min_i=$i
    for s in $@; do
	if [ $s -lt $min ]; then
	    min=$s
	    min_i=$i
	fi
	i=$((i+1))
    done

    echo $min_i
}


generation=1
while [[ $goal != $str ]]; do

    # reproduction
    make_individual "$str"; i0=$result
    make_individual "$str"; i1=$result
    make_individual "$str"; i2=$result
    make_individual "$str"; i3=$result
    make_individual "$str"; i4=$result
    make_individual "$str"; i5=$result
    make_individual "$str"; i6=$result
    make_individual "$str"; i7=$result
    make_individual "$str"; i8=$result
    make_individual "$str"; i9=$result

    # selection
    f0=$(string_distance "$i0" "$goal")
    f1=$(string_distance "$i1" "$goal")
    f2=$(string_distance "$i2" "$goal")
    f3=$(string_distance "$i3" "$goal")
    f4=$(string_distance "$i4" "$goal")
    f5=$(string_distance "$i5" "$goal")
    f6=$(string_distance "$i6" "$goal")
    f7=$(string_distance "$i7" "$goal")
    f8=$(string_distance "$i8" "$goal")
    f9=$(string_distance "$i9" "$goal")
    eval str=\$i$(min $f0 $f1 $f2 $f3 $f4 $f5 $f6 $f7 $f8 $f9)

    # show winner of this round
    echo "$generation: $str"
    generation=$((generation+1))
done
