#!/bin/sh

if [ "$MIGRATION" = "TRUE" ];
then
    flask db init
    flask db migrate
    flask db upgrade
else
    echo "Migrations not running.";
    flask run
fi;