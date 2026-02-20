#!/bin/bash

declare Habit="$1"
declare Date="$2"

setUserInput() {
    local -n userHabit="$1"
    local -n userDate="$2"

    if [[ -z "$userHabit" ]]
    then
        echo "Arguments were not satisfied!" >&2
        sleep 1
        exit 1
    else
        echo "Arguments are satisfied!" >&2
        sleep 1
    fi

    if [[ -z "$userDate" ]]
    then
        echo "Arguments were not satisfied!: Date set to current." >&2
        sleep 1
        userDate=$(date '+%Y-%m-%d')
    else
        if ! [[ "$userDate" =~ ^[0-9]{4}/[0-9]{2}/[0-9]{2}$ ]]
        then
            echo "Arguments were not satisfied!: Expected date in YYYY-MM-DD format." >&2
            exit 1
        else
            echo "Arguments are satisfied!" >&2
            sleep 1
        fi
    fi

    DBFile="DBStoreUserTemp.DB"

    if [[ -f "$DBFile" ]]
    then
        echo "DB Active!" >&2
        sleep 1
    else
        echo "DB Inactive!" >&2
        sleep 1

        touch "$DBFile"
        echo "New DB is Active!" >&2
    fi
}

setDBData() {
    local -n userHabit="$1"
    local -n userDate="$2"
    local ref_DBFile="$3"

    local DB_Habit #temp vars to save file split values
    local DB_Date

    while IFS='|' read -r DB_Habit DB_Date || [[ -n "$DB_Habit" ]] #reads each line in DBfile and splits using the delimiter to either vars | [ -n] used to ignore the /n rule in IFS
    do
        echo "$DB_Habit"
        echo "$DB_Date"
        sleep 1
    done < "$ref_DBFile"
        
}

setUserInput Habit Date
setDBData Habit Date "$DBFile"