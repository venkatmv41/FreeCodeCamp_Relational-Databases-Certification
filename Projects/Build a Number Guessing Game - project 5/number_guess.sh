#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

NUMBER=$(( RANDOM % 1000 +1 ))
echo "Enter your username:"
read USERNAME
USER_INFO=$($PSQL "SELECT games_played,best_game FROM details WHERE username='$USERNAME'")

if [[ -z $USER_INFO ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
IFS="|" read NAME GAMES_PLAYED BEST_GAME <<< "$USER_INFO"
echo "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses. "
fi

echo "Guess the secret number between 1 and 1000:"
read G_NUM

NUMBER_OF_GUESSES=0
while true
do
((NUMBER_OF_GUESSES++))
if [[ ! $G_NUM =~ ^[0-9]+$ ]]
then
  echo "That is not an integer, guess again:"
  read G_NUM

else
  if [[ $G_NUM -gt $NUMBER ]]
  then
    echo "It's lower than that, guess again:"
    read G_NUM
  elif [[ $G_NUM -lt $NUMBER ]]
  then
    echo "It's higher than that, guess again:"
    read G_NUM

else
  echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $NUMBER. Nice job!"

  if [[ -z $USER_INFO ]]
  then
    $PSQL "INSERT INTO details(username, games_played, best_game) VALUES('$USERNAME', 1, $NUMBER_OF_GUESSES);" > /dev/null
  else
    NEW_GAMES_PLAYED=$((GAMES_PLAYED + 1))

    if [[ $NUMBER_OF_GUESSES -lt $BEST_GAME ]]
    then
      $PSQL "UPDATE details SET games_played=$NEW_GAMES_PLAYED, best_game=$NUMBER_OF_GUESSES WHERE username='$USERNAME';" > /dev/null
    else
      $PSQL "UPDATE details SET games_played=$NEW_GAMES_PLAYED WHERE username='$USERNAME';" > /dev/null

  fi

  break
fi



fi
# G_NUM lt or gt

fi 
#G_NUM IS INTEGER
done
