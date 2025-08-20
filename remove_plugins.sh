#!/bin/bash

rm -rf ~/.var/app/org.wezfurlong.wezterm/data/wezterm/plugins/*
git add . && git commit --amend --no-edit
git push -u --force-with-lease origin
