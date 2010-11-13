while true;
do
    find $HOME/Dropbox/wallpapers -type f -name '*.jpg' -o -name '*.png' | shuf -n 1 | xargs feh --bg-scale
    sleep 15m
done &