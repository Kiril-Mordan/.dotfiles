#!/bin/bash
echo "Running clean filter for .gitconfig" >> logfile.txt

sed "s/$GIT_USER_NAME/REDACTED/g" | sed "s/$GIT_AUTHOR_EMAIL/REDACTED/g"

