#!/bin/bash

declare Habit="$1"
declare Date="$2"

setUserInput() {
    local -n userHabit="$1"
    local -n userDate="$2"

    if [[ -z "$userHabit" ]]
    then
        echo "Arguments were not satisfied!"
        sleep 1
        exit 1
    else
        echo "Arguments are satisfied!"
        sleep 1
    fi

    if [[ -z "$userDate" ]]
    then
        echo "Arguments were not satisfied!: Date set to current."
        sleep 1
        userDate=$(date '+%Y-%m-%d')
    else
        if ! [[ "$userDate" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]
        then
            echo "Arguments were not satisfied!: Expected date in YYYY-MM-DD format."
            exit 1
        else
            echo "Arguments are satisfied!"
            sleep 1
        fi
    fi

    DBFile="DBStoreUser.DB"

    if [[ -f "$DBFile" ]]
    then
        echo "DB Active!"
        sleep 1
    else
        echo "DB Inactive!"
        sleep 1

        touch "$DBFile"
        echo "New DB is Active!"
    fi

    echo "Test Var:"
    echo "Habit: $userHabit"
    echo "Date: $userDate"
}

setUserInput Habit Date