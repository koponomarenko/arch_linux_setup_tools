#!/bin/bash

step=5

value=$(light -G)
value=${value%.*}

increase() {
    if [[ ${value} -lt 5 ]]; then
        step=1
    fi
    exec light -A ${step}
}

decrease() {
    if [[ ${value} -le 5 ]]; then
        step=1
    fi
    exec light -U ${step}
}

if [[ "${1}" == "increase" ]]; then
    increase
elif [[ "${1}" == "decrease" ]]; then
    decrease
fi
