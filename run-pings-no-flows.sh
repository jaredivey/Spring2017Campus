#! /bin/bash 

language=$1
logtype=$2
scriptname=$3
portcheck=$4
numflows=$5
auto=$6

echo "run-pings-no-flows.sh $language $logtype $scriptname $portcheck $numflows $auto"

#
# Start controller
#
bash startController.sh $language $scriptname $portcheck

# Prime network for senders and receivers
for num in 1
do
    ssh jivey@pc1.geni.kettering.edu -p 30266 "arping -q -Ieth$num -c1 10.10.1.4"
done
for num in {1..8}
do
    ssh jivey@pc1.geni.kettering.edu -p 30271 "arping -q -Ieth$num -c1 10.10.1.4"
    ssh jivey@pc5.geni.kettering.edu -p 30268 "arping -q -Ieth$num -c1 10.10.1.4"
done
echo "Network primed"

date +"%s.%3N" >> .tmp/temp0
date +"%s.%3N" >> .tmp/temp2
date +"%s.%3N" >> .tmp/temp3

#
# Wait 20 seconds (arbitrary) to allow traffic to occur before sending the pings
#
for num in {20..0}
do
    echo $num
    sleep 1
done
echo "Ping from host 1-0-0"
date +"%s.%3N" >> .tmp/temp0
ssh jivey@pc1.geni.kettering.edu -p 30266 "ping -q -s1422 -c1 10.10.1.4" >> .tmp/temp0
ssh jivey@pc1.geni.kettering.edu -p 30266 "ping -q -s1422 -c1 10.10.1.4" >> .tmp/temp0
ssh jivey@pc1.geni.kettering.edu -p 30266 "ping -q -s1422 -c1 10.10.1.4" >> .tmp/temp0
cat .tmp/temp0
echo "Ping from host 2-9"
date +"%s.%3N" >> .tmp/temp2
ssh jivey@pc1.geni.kettering.edu -p 30271 "ping -q -s1422 -c1 10.10.1.4" >> .tmp/temp2
ssh jivey@pc1.geni.kettering.edu -p 30271 "ping -q -s1422 -c1 10.10.1.4" >> .tmp/temp2
ssh jivey@pc1.geni.kettering.edu -p 30271 "ping -q -s1422 -c1 10.10.1.4" >> .tmp/temp2
cat .tmp/temp2
echo "Ping from host 3-5"
date +"%s.%3N" >> .tmp/temp3
ssh jivey@pc5.geni.kettering.edu -p 30268 "ping -q -s1422 -c1 10.10.1.4" >> .tmp/temp3
ssh jivey@pc5.geni.kettering.edu -p 30268 "ping -q -s1422 -c1 10.10.1.4" >> .tmp/temp3
ssh jivey@pc5.geni.kettering.edu -p 30268 "ping -q -s1422 -c1 10.10.1.4" >> .tmp/temp3
cat .tmp/temp3

date +"%s.%3N" >> .tmp/temp0
date +"%s.%3N" >> .tmp/temp2
date +"%s.%3N" >> .tmp/temp3

#
# Final cleanup
#
echo "Final cleanup"
bash cleanup.sh $language

#
# Pull log information over to local
#
echo "Capture log files? "
if [ "$auto" == "auto" ]
then
    store="y"
else
    read store
fi

if [ $store == "y" ]
then
    echo "Store"
    ssh jivey@pc4.geni.kettering.edu -p 30266 "cat /users/jivey/temp" >> logs/ctrl/$language-$logtype-$numflows.log
    cat .tmp/temp0 >> logs/pings/pings-subnet0-$language-$logtype-$numflows.log
    cat .tmp/temp2 >> logs/pings/pings-subnet2-$language-$logtype-$numflows.log
    cat .tmp/temp3 >> logs/pings/pings-subnet3-$language-$logtype-$numflows.log
else
    echo "Discard"
fi
rm .tmp/temp0
rm .tmp/temp2
rm .tmp/temp3
