#!/bin/bash

log="log/bash.log"

STOREF="./tmp/hashes_store.csv"
INF="./tmp/hashes_in.csv"
OUTF="./tmp/hashes_out.csv"

echo $(date) $0 "- Entered kd_tree.sh with params" $1 $2 >> $log

if [ $(pgrep kdtree | wc -l) -eq 0 ]; then
	echo $(date) $0 "- kdtree is not currently running, starting setup script" >> $log
	./kd_tree_setup.sh $STOREF $INF $OUTF
fi


if [ $(pgrep -f kd_tree_sleep.sh | wc -l) -ne 0 ]; then
	echo $(date) $0 "- killing previous kd_tree_sleep.sh script as we need kdtree now" >> $log
	pkill -f kd_tree_sleep.sh
fi

#takes in hash and returns closest

echo "$1,$2" >> $INF

out=''
while( [ -z $out ] ); do #test that program has not returned; probably need to make better in case prog closes
	out=$(grep $1 $OUTF)
	sleep 1
done

echo $out | cut -f 2 -d , - #gets similar id field of hashes_out

echo $(date) $0 "- Got result from kdtree " $(echo $out | cut -f 2 -d , -) >> $log

echo "$1,$2" >> $STOREF

#

if [ $(pgrep kd_tree_sleep | wc -l) -ne 0 ]; then
	echo $(date) $0 "- killing previous kd_tree_sleep.sh script as we need kdtree now" >> $log
	pkill -f kd_tree_sleep.sh
fi

echo $(date) $0 "- Starting kd_tree_sleep.sh" >> $log
./kd_tree_sleep.sh $STOREF $INF $OUTF & disown
