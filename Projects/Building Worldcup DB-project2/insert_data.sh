#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENET_GOALS
do
if [[ $WINNER != 'winner' && $OPPONENT != 'opponent' ]]
then
TEAMS_INITIAL_QUERY=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
if [[ -z $TEAMS_INITIAL_QUERY ]]
then
TEAMS_INSERT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
fi
TEAMS_FINAL_QUERY=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
if [[ -z $TEAMS_FINAL_QUERY  ]]
then
TEAMS_FINAL_INSERT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
fi

#games
INSERT_WINNER_QUERY=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
INSERT_OPPONENT_QUERY=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
INSERT_INITIAL_GAMES=$($PSQL "INSERT INTO games(year,round,winner_goals,opponent_goals,winner_id,opponent_id) VALUES($YEAR, '$ROUND', $WINNER_GOALS, $OPPONENET_GOALS,$INSERT_WINNER_QUERY,$INSERT_OPPONENT_QUERY)")
#INSERT_FINAL_GAMES=$($PSQL "INSERT INTO games(winner_id,opponent_id) VALUES($INSERT_WINNER_QUERY,$INSERT_OPPONENT_QUERY)")

fi
done