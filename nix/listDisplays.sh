# If you run into issues (like remotely logging into your home computer and you get XServer errors, list these displays and then run EXPORT=$DISPLAY to fix it
cd /tmp/.X11-unix && for x in X*; do echo ":${x#X}"; done
