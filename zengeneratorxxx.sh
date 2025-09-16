

echo "Press 'q' to exit zen generator."
play -q "water.flac" repeat 1000000000 & play -q "fire.flac" vol "0.9" repeat 1000000000 &
tibetan=0
while true; do
minmax=$(( (RANDOM % 9) + 0 ))
bamboo=$(find /bamboo -type f | shuf -n 1)
sleepdur="0."
sleepdur+=$minmax
play -q "$bamboo" vol "$sleepdur" &
sleep $sleepdur
sleepdur=""
((tibetan++))
if [[ $tibetan -gt 25 ]]; then
bowls=$(find /tibetan -type f | shuf -n 1)
play -q "$bowls" &
tibetan=0
fi
read -n 1 -t 0.1 input
    if [[ $input = "q" ]] || [[ $input = "Q" ]]; then
        echo "Exiting loop."
        pkill play
        break # Exit the loop if 'q' is pressed
    fi
done