
END=10
function screen_function {
	xrandr --output $SCREEN --brightness $1
	echo "$SCREEN $1"
}

SCREEN_LIST=$(xrandr | grep -v "   \|:" | cut -d " " -f 1)
for i in $(seq 1 $END);
do

	for SCREEN in $SCREEN_LIST
	do
		BRI="$(shuf -i 0-4| head -1)-2"
		screen_function $(echo $BRI | bc)
		sleep 0.1
	done
	sleep 0.3
done

for SCREEN in $SCREEN_LIST
do
	screen_function 1
	sleep 0.1
done
