#!/bin/sh
flask db migrate -m "Initial migration."
flask db upgrade
flask run