#!/bin/bash

DATABASE="address-book-database.csv"

if [[ "$1" == "view" ]]; then
  if [[ -f "$DATABASE" ]]; then
    (head -n 1 "$DATABASE" && tail -n +2 "$DATABASE" | sort -t, -k4) | column -t -s,
  else
    echo "Error: The file $DATABASE does not exist."
  fi
elif [[ "$1" == "search" ]]; then
  if [[ -f "$DATABASE" ]]; then
    SEARCH_STRING="$2"
    RESULTS=$(grep -i "$SEARCH_STRING" "$DATABASE" | tail -n +2) # Excludes the header
    if [[ -z "$RESULTS" ]]; then
      echo "Not found."
    else
      IFS=$'\n'
      for LINE in $RESULTS; do
        IFS=',' read -r NAME SURNAME PHONE MAIL CITY ADDRESS <<< "$LINE"
        echo "Name: $NAME"
        echo "Surname: $SURNAME"
        echo "Phone: $PHONE"
        echo "Mail: $MAIL"
        echo "City: $CITY"
        echo "Address: $ADDRESS"
        echo ""
      done
    fi
  else
    echo "Error: The file $DATABASE does not exist."
  fi
elif [[ "$1" == "insert" ]]; then
  if [[ -f "$DATABASE" ]]; then
    echo -n "Name: "
    # shellcheck disable=SC2162
    read NAME
    echo -n "Surname: "
    read SURNAME
    echo -n "Phone: "
    read PHONE
    echo -n "Mail: "
    read MAIL
    echo -n "City: "
    read CITY
    echo -n "Address: "
    read ADDRESS

    # Check if the email already exists
    if grep -q -x ".*,.*,.*,$MAIL,.*,.*" "$DATABASE"; then
      echo "Error: The email address $MAIL already exists."
    else
      # Add the new entry to the file
      echo "$NAME,$SURNAME,$PHONE,$MAIL,$CITY,$ADDRESS" >> "$DATABASE"
      echo "Added"
    fi
  else
    echo "Error: The file $DATABASE does not exist."
  fi
elif [[ "$1" == "delete" ]]; then
  if [[ -f "$DATABASE" ]]; then
    MAIL_TO_DELETE="$2"
    if grep -q -x ".*,.*,.*,$MAIL_TO_DELETE,.*,.*" "$DATABASE"; then
      # Keep the header and remove the corresponding row
      (head -n 1 "$DATABASE" && grep -v -x ".*,.*,.*,$MAIL_TO_DELETE,.*,.*" "$DATABASE") > temp.csv
      mv temp.csv "$DATABASE"
      echo "Deleted"
    else
      echo "Cannot find any record."
    fi
  else
    echo "Error: The file $DATABASE does not exist."
  fi
else
  echo "Usage: $0 {view|search <string>|insert|delete <mail>}"
fi