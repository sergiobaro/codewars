#!/bin/bash

# You throw a ball vertically upwards with an initial speed v (in km per hour). 
# The height h of the ball at each time t is given by h = v*t - 0.5*g*t*t where g is Earth's gravity (g ~ 9.81 m/s**2). 
# A device is recording at every tenth of second the height of the ball. 
# For example with v = 15 km/h the device gets something of the following form: (0, 0.0), (1, 0.367...), (2, 0.637...), (3, 0.808...), (4, 0.881..) ... 
# where the first number is the time in tenth of second and the second number the height in meter.

# Task
# Write a function max_ball with parameter v (in km per hour) that returns the time in tenth of second of the maximum height recorded by the device.

# Examples:
# max_ball(15) should return 4

# max_ball(25) should return 7

# Notes
# Remember to convert the velocity from km/h to m/s or from m/s in km/h when necessary.
# The maximum height recorded by the device is not necessarily the maximum height reached by the ball.


max_ball() {
    local scale=4
    local v=$(echo "scale=$scale; $1 * 1000 / (60 * 60) " | bc -l)
    local g="9.81"

    local last_height="0.0"
    local current_height="0.0"

    local i=0
    while (( $(echo "$last_height <= $current_height" | bc -l) )); do
        last_height=$current_height

        local t=$(echo "scale=$scale; $i * 0.1" | bc -l)
        local f="$v * $t - 0.5 * $g * $t * $t"
        current_height=$(echo "scale=$scale; $f" | bc -l)

        i=$(( $i + 1 ))
    done

    echo $(( $i - 2 ))
}

testing() {
    local result=$( max_ball $1 )
    if [ $result = $2 ]; then
        echo "OK"
    else 
        echo "KO: expected $2, got $result"
    fi
}

testing "15" "4"
testing "25" "7"
testing "45" "13"
testing "99" "28"