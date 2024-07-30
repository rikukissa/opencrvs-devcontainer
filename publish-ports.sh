#!/bin/bash
set -e

gh codespace ports visibility 3040:public -c $CODESPACE_NAME
gh codespace ports visibility 7070:public -c $CODESPACE_NAME
gh codespace ports visibility 2021:public -c $CODESPACE_NAME
gh codespace ports visibility 4040:public -c $CODESPACE_NAME
gh codespace ports visibility 3535:public -c $CODESPACE_NAME

gh codespace ports visibility 3000:public -c $CODESPACE_NAME
gh codespace ports visibility 3020:public -c $CODESPACE_NAME

gh codespace ports update 3535 --protocol https -c $CODESPACE_NAME