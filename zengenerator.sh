

echo "Press 'q' to exit zen generator."
play -q "water.flac" repeat 1000000000 & play -q "rainx.flac" repeat 1000000000 & play -q "skiesx.flac" repeat 1000000000 &
tibetan=0
taiko=0
while true; do
minmax=$(( (RANDOM % 9) + 1 ))
bamboo=$(find /bamboo -type f | shuf -n 1)
sleepdur="0."
sleepdur+=$minmax
play -q "$bamboo" vol "$sleepdur" &
sleep $sleepdur
sleepdur=""
((tibetan++))
if [[ $tibetan -gt 100 ]]; then
bowls=$(find /tibetan -type f | shuf -n 1)
play -q "$bowls" &
tibetan=0
fi
((taiko++))
if [[ $taiko -gt 1 ]]; then
hits=$(( (RANDOM % 7) + 1 ))
for (( k=1; k<=$hits; k++ )); do
drums=$(find /bamboo -type f | shuf -n 1)        
minmax=$(( (RANDOM % 3) + 1 ))
sleepdur="0."
sleepdur+=$minmax
play -q "$drums" vol 0.9 &
sleep $sleepdur
done
taiko=0
fi
read -n 1 -t 0.1 input
    if [[ $input = "q" ]] || [[ $input = "Q" ]]; then
        echo "Exiting loop."
        pkill play
        break # Exit the loop if 'q' is pressed
    fi
done