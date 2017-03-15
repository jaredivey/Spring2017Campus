#! /bin/bash 

language=$1
logtype=$2
scriptname=$3
portcheck=$4
numflows=$5
auto=$6

echo "run-pings-3-flows.sh $language $logtype $scriptname $portcheck $numflows $auto"

#
# Start controller
#
bash startController.sh $language $scriptname $portcheck

# Prime network for senders and receivers
for num in 1
do
    ssh jivey@pc1.geni.kettering.edu -p 30266 "arping -q -Ieth$num -c1 10.10.1.4"
    sleep 1
done
for num in {1..8}
do
    ssh jivey@pc1.geni.kettering.edu -p 30271 "arping -q -Ieth$num -c1 10.10.1.4"
    ssh jivey@pc5.geni.kettering.edu -p 30268 "arping -q -Ieth$num -c1 10.10.1.4"
    sleep 1
done
for num in {1..8}
do
    ssh jivey@pc4.geni.kettering.edu -p 30267 "arping -q -Ieth$num -c1 10.10.1.1"
    ssh jivey@pc5.geni.kettering.edu -p 30266 "arping -q -Ieth$num -c1 10.10.1.2"
    ssh jivey@pc2.geni.kettering.edu -p 30268 "arping -q -Ieth$num -c1 10.10.1.3"
    ssh jivey@pc1.geni.kettering.edu -p 30272 "arping -q -Ieth$num -c1 10.10.1.4"
    sleep 1

    ssh jivey@pc1.geni.kettering.edu -p 30269 "arping -q -Ieth$num -c1 10.10.1.1"
    ssh jivey@pc1.geni.kettering.edu -p 30270 "arping -q -Ieth$num -c1 10.10.1.2"
    ssh jivey@pc5.geni.kettering.edu -p 30267 "arping -q -Ieth$num -c1 10.10.1.3"
    ssh jivey@pc3.geni.kettering.edu -p 30267 "arping -q -Ieth$num -c1 10.10.1.4"
    sleep 1

    ssh jivey@pc3.geni.kettering.edu -p 30266 "arping -q -Ieth$num -c1 10.10.1.1"
    ssh jivey@pc2.geni.kettering.edu -p 30267 "arping -q -Ieth$num -c1 10.10.1.2"
    ssh jivey@pc1.geni.kettering.edu -p 30271 "arping -q -Ieth$num -c1 10.10.1.3"
    ssh jivey@pc5.geni.kettering.edu -p 30268 "arping -q -Ieth$num -c1 10.10.1.4"
    sleep 1
done
echo "Network primed"

#
# Start UDP servers (Host 1-0-0)
#
for port in 45000
do
    for ipnum in {1..4}
    do
        let portnum=$port+$ipnum
        let realipnum=0+$ipnum
        ssh -f jivey@pc1.geni.kettering.edu -p 30266 "iperf -u -l1400 -s -p$portnum > /users/jivey/temp-$portnum.log &"
        ssh -f jivey@pc1.geni.kettering.edu -p 30266 "sudo tcpdump -i any udp and src 10.10.2.$realipnum and dst 10.10.1.1 &> /users/jivey/tcpdump-$portnum.log &"
        sleep 1

        let portnum=$port+$ipnum+100
        let realipnum=16+$ipnum
        ssh -f jivey@pc1.geni.kettering.edu -p 30266 "iperf -u -l1400 -s -p$portnum > /users/jivey/temp-$portnum.log &"
        ssh -f jivey@pc1.geni.kettering.edu -p 30266 "sudo tcpdump -i any udp and src 10.10.2.$realipnum and dst 10.10.1.1 &> /users/jivey/tcpdump-$portnum.log &"
        sleep 1

        let portnum=$port+$ipnum+200
        let realipnum=32+$ipnum
        ssh -f jivey@pc1.geni.kettering.edu -p 30266 "iperf -u -l1400 -s -p$portnum > /users/jivey/temp-$portnum.log &"
        ssh -f jivey@pc1.geni.kettering.edu -p 30266 "sudo tcpdump -i any udp and src 10.10.2.$realipnum and dst 10.10.1.1 &> /users/jivey/tcpdump-$portnum.log &"
        sleep 1
    done
done

# Make sure all servers have started
echo "0" > .tmp/iperfs
while [ $(cat .tmp/iperfs) -lt 12 ]
do
    ssh jivey@pc1.geni.kettering.edu -p 30266 "pgrep iperf | sed '/^\s*$/d' | wc -l" > .tmp/iperfs
    sleep 1
done
rm .tmp/iperfs

#
# Start UDP servers (Host 1-0-1)
#
for port in 45000
do
    for ipnum in {1..4}
    do
        let portnum=$port+$ipnum
        let realipnum=8+$ipnum
        ssh -f jivey@pc2.geni.kettering.edu -p 30266 "iperf -u -l1400 -s -p$portnum > /users/jivey/temp-$portnum.log &"
        ssh -f jivey@pc2.geni.kettering.edu -p 30266 "sudo tcpdump -i any udp and src 10.10.2.$realipnum and dst 10.10.1.2 &> /users/jivey/tcpdump-$portnum.log &"
        sleep 1

        let portnum=$port+$ipnum+100
        let realipnum=24+$ipnum
        ssh -f jivey@pc2.geni.kettering.edu -p 30266 "iperf -u -l1400 -s -p$portnum > /users/jivey/temp-$portnum.log &"
        ssh -f jivey@pc2.geni.kettering.edu -p 30266 "sudo tcpdump -i any udp and src 10.10.2.$realipnum and dst 10.10.1.2 &> /users/jivey/tcpdump-$portnum.log &"
        sleep 1

        let portnum=$port+$ipnum+200
        let realipnum=40+$ipnum
        ssh -f jivey@pc2.geni.kettering.edu -p 30266 "iperf -u -l1400 -s -p$portnum > /users/jivey/temp-$portnum.log &"
        ssh -f jivey@pc2.geni.kettering.edu -p 30266 "sudo tcpdump -i any udp and src 10.10.2.$realipnum and dst 10.10.1.2 &> /users/jivey/tcpdump-$portnum.log &"
        sleep 1
    done
done

# Make sure all servers have started
echo "0" > .tmp/iperfs
while [ $(cat .tmp/iperfs) -lt 12 ]
do
    ssh jivey@pc2.geni.kettering.edu -p 30266 "pgrep iperf | sed '/^\s*$/d' | wc -l" > .tmp/iperfs
    sleep 1
done
rm .tmp/iperfs

#
# Start UDP servers (Host 1-1-0)
#
for port in 45000
do
    for ipnum in {1..4}
    do
        let portnum=$port+$ipnum
        let realipnum=0+$ipnum
        ssh -f jivey@pc1.geni.kettering.edu -p 30267 "iperf -u -l1400 -s -p$portnum > /users/jivey/temp-$portnum.log &"
        ssh -f jivey@pc1.geni.kettering.edu -p 30267 "sudo tcpdump -i any udp and src 10.10.3.$realipnum and dst 10.10.1.3 &> /users/jivey/tcpdump-$portnum.log &"
        sleep 1

        let portnum=$port+$ipnum+100
        let realipnum=16+$ipnum
        ssh -f jivey@pc1.geni.kettering.edu -p 30267 "iperf -u -l1400 -s -p$portnum > /users/jivey/temp-$portnum.log &"
        ssh -f jivey@pc1.geni.kettering.edu -p 30267 "sudo tcpdump -i any udp and src 10.10.3.$realipnum and dst 10.10.1.3 &> /users/jivey/tcpdump-$portnum.log &"
        sleep 1

        let portnum=$port+$ipnum+200
        let realipnum=48+$ipnum
        ssh -f jivey@pc1.geni.kettering.edu -p 30267 "iperf -u -l1400 -s -p$portnum > /users/jivey/temp-$portnum.log &"
        ssh -f jivey@pc1.geni.kettering.edu -p 30267 "sudo tcpdump -i any udp and src 10.10.2.$realipnum and dst 10.10.1.3 &> /users/jivey/tcpdump-$portnum.log &"
        sleep 1
    done
done

# Make sure all servers have started
echo "0" > .tmp/iperfs
while [ $(cat .tmp/iperfs) -lt 12 ]
do
    ssh jivey@pc1.geni.kettering.edu -p 30267 "pgrep iperf | sed '/^\s*$/d' | wc -l" > .tmp/iperfs
    sleep 1
done
rm .tmp/iperfs

#
# Start UDP servers (Host 1-1-1)
#
for port in 45000
do
    for ipnum in {1..4}
    do
        let portnum=$port+$ipnum
        let realipnum=8+$ipnum
        ssh -f jivey@pc1.geni.kettering.edu -p 30268 "iperf -u -l1400 -s -p$portnum > /users/jivey/temp-$portnum.log &"
        ssh -f jivey@pc1.geni.kettering.edu -p 30268 "sudo tcpdump -i any udp and src 10.10.3.$realipnum and dst 10.10.1.4 &> /users/jivey/tcpdump-$portnum.log &"
        sleep 1

        let portnum=$port+$ipnum+100
        let realipnum=24+$ipnum
        ssh -f jivey@pc1.geni.kettering.edu -p 30268 "iperf -u -l1400 -s -p$portnum > /users/jivey/temp-$portnum.log &"
        ssh -f jivey@pc1.geni.kettering.edu -p 30268 "sudo tcpdump -i any udp and src 10.10.3.$realipnum and dst 10.10.1.4 &> /users/jivey/tcpdump-$portnum.log &"
        sleep 1

        let portnum=$port+$ipnum+200
        let realipnum=32+$ipnum
        ssh -f jivey@pc1.geni.kettering.edu -p 30268 "iperf -u -l1400 -s -p$portnum > /users/jivey/temp-$portnum.log &"
        ssh -f jivey@pc1.geni.kettering.edu -p 30268 "sudo tcpdump -i any udp and src 10.10.3.$realipnum and dst 10.10.1.4 &> /users/jivey/tcpdump-$portnum.log &"
        sleep 1
    done
done

# Make sure all servers have started
echo "0" > .tmp/iperfs
while [ $(cat .tmp/iperfs) -lt 12 ]
do
    ssh jivey@pc1.geni.kettering.edu -p 30268 "pgrep iperf | sed '/^\s*$/d' | wc -l" > .tmp/iperfs
    sleep 1
done
rm .tmp/iperfs

sleep 5

echo "Servers up"

date +"%s.%3N" >> .tmp/temp0
date +"%s.%3N" >> .tmp/temp2
date +"%s.%3N" >> .tmp/temp3

#
# Start UDP clients (Host 2-3 to 1-0-0)
#
for port in 45000
do
    for ipnum in {1..4}
    do
        let portnum=$port+$ipnum
        let realipnum=0+$ipnum
        ssh -f jivey@pc4.geni.kettering.edu -p 30267 "iperf -u -l1400 -c 10.10.1.1 -p$portnum -B10.10.2.$realipnum -b 100K -t180 > /users/jivey/temp-$portnum.log &"
        ssh -f jivey@pc4.geni.kettering.edu -p 30267 "sudo tcpdump -i any udp and src 10.10.2.$realipnum and dst 10.10.1.1 &> /users/jivey/tcpdump-$portnum.log &"
    done
done

#
# Start UDP clients (Host 2-4 to 1-0-1)
#
for port in 45000
do
    for ipnum in {1..4}
    do
        let portnum=$port+$ipnum
        let realipnum=8+$ipnum
        ssh -f jivey@pc5.geni.kettering.edu -p 30266 "iperf -u -l1400 -c 10.10.1.2 -p$portnum -B10.10.2.$realipnum -b 100K -t180 > /users/jivey/temp-$portnum.log &"
        ssh -f jivey@pc5.geni.kettering.edu -p 30266 "sudo tcpdump -i any udp and src 10.10.2.$realipnum and dst 10.10.1.2 &> /users/jivey/tcpdump-$portnum.log &"
    done
done

#
# Start UDP clients (Host 2-5 to 1-0-0)
#
for port in 45000
do
    for ipnum in {1..4}
    do
        let portnum=$port+$ipnum+100
        let realipnum=16+$ipnum
        ssh -f jivey@pc1.geni.kettering.edu -p 30269 "iperf -u -l1400 -c 10.10.1.1 -p$portnum -B10.10.2.$realipnum -b 100K -t180 > /users/jivey/temp-$portnum.log &"
        ssh -f jivey@pc1.geni.kettering.edu -p 30269 "sudo tcpdump -i any udp and src 10.10.2.$realipnum and dst 10.10.1.1 &> /users/jivey/tcpdump-$portnum.log &"
    done
done

#
# Start UDP clients (Host 2-6 to 1-0-1)
#
for port in 45000
do
    for ipnum in {1..4}
    do
        let portnum=$port+$ipnum+100
        let realipnum=24+$ipnum
        ssh -f jivey@pc1.geni.kettering.edu -p 30270 "iperf -u -l1400 -c 10.10.1.2 -p$portnum -B10.10.2.$realipnum -b 100K -t180 > /users/jivey/temp-$portnum.log &"
        ssh -f jivey@pc1.geni.kettering.edu -p 30270 "sudo tcpdump -i any udp and src 10.10.2.$realipnum and dst 10.10.1.2 &> /users/jivey/tcpdump-$portnum.log &"
    done
done

#
# Start UDP clients (Host 2-7 to 1-0-0)
#
for port in 45000
do
    for ipnum in {1..4}
    do
        let portnum=$port+$ipnum+200
        let realipnum=32+$ipnum
        ssh -f jivey@pc3.geni.kettering.edu -p 30266 "iperf -u -l1400 -c 10.10.1.1 -p$portnum -B10.10.2.$realipnum -b 100K -t180 > /users/jivey/temp-$portnum.log &"
        ssh -f jivey@pc3.geni.kettering.edu -p 30266 "sudo tcpdump -i any udp and src 10.10.2.$realipnum and dst 10.10.1.1 &> /users/jivey/tcpdump-$portnum.log &"
    done
done

#
# Start UDP clients (Host 2-8 to 1-0-1)
#
for port in 45000
do
    for ipnum in {1..4}
    do
        let portnum=$port+$ipnum+200
        let realipnum=40+$ipnum
        ssh -f jivey@pc2.geni.kettering.edu -p 30267 "iperf -u -l1400 -c 10.10.1.2 -p$portnum -B10.10.2.$realipnum -b 100K -t180 > /users/jivey/temp-$portnum.log &"
        ssh -f jivey@pc2.geni.kettering.edu -p 30267 "sudo tcpdump -i any udp and src 10.10.2.$realipnum and dst 10.10.1.2 &> /users/jivey/tcpdump-$portnum.log &"
    done
done

#
# Start UDP clients (Host 3-1 to 1-1-0)
#
for port in 45000
do
    for ipnum in {1..4}
    do
        let portnum=$port+$ipnum
        let realipnum=0+$ipnum
        ssh -f jivey@pc2.geni.kettering.edu -p 30268 "iperf -u -l1400 -c 10.10.1.3 -p$portnum -B10.10.3.$realipnum -b 100K -t180 > /users/jivey/temp-$portnum.log &"
        ssh -f jivey@pc2.geni.kettering.edu -p 30268 "sudo tcpdump -i any udp and src 10.10.3.$realipnum and dst 10.10.1.3 &> /users/jivey/tcpdump-$portnum.log &"
    done
done

#
# Start UDP clients (Host 3-2 to 1-1-1)
#
for port in 45000
do
    for ipnum in {1..4}
    do
        let portnum=$port+$ipnum
        let realipnum=8+$ipnum
        ssh -f jivey@pc1.geni.kettering.edu -p 30272 "iperf -u -l1400 -c 10.10.1.4 -p$portnum -B10.10.3.$realipnum -b 100K -t180 > /users/jivey/temp-$portnum.log &"
        ssh -f jivey@pc1.geni.kettering.edu -p 30272 "sudo tcpdump -i any udp and src 10.10.3.$realipnum and dst 10.10.1.4 &> /users/jivey/tcpdump-$portnum.log &"
    done
done

#
# Start UDP clients (Host 3-3 to 1-1-0)
#
for port in 45000
do
    for ipnum in {1..4}
    do
        let portnum=$port+$ipnum+100
        let realipnum=16+$ipnum
        ssh -f jivey@pc5.geni.kettering.edu -p 30267 "iperf -u -l1400 -c 10.10.1.3 -p$portnum -B10.10.3.$realipnum -b 100K -t180 > /users/jivey/temp-$portnum.log &"
        ssh -f jivey@pc5.geni.kettering.edu -p 30267 "sudo tcpdump -i any udp and src 10.10.3.$realipnum and dst 10.10.1.3 &> /users/jivey/tcpdump-$portnum.log &"
    done
done

#
# Start UDP clients (Host 3-4 to 1-1-1)
#
for port in 45000
do
    for ipnum in {1..4}
    do
        let portnum=$port+$ipnum+100
        let realipnum=24+$ipnum
        ssh -f jivey@pc3.geni.kettering.edu -p 30267 "iperf -u -l1400 -c 10.10.1.4 -p$portnum -B10.10.3.$realipnum -b 100K -t180 > /users/jivey/temp-$portnum.log &"
        ssh -f jivey@pc3.geni.kettering.edu -p 30267 "sudo tcpdump -i any udp and src 10.10.3.$realipnum and dst 10.10.1.4 &> /users/jivey/tcpdump-$portnum.log &"
    done
done

#
# Start UDP clients (Host 2-9 to 1-1-0)
#
for port in 45000
do
    for ipnum in {1..4}
    do
        let portnum=$port+$ipnum+200
        let realipnum=48+$ipnum
        ssh -f jivey@pc1.geni.kettering.edu -p 30271 "iperf -u -l1400 -c 10.10.1.3 -p$portnum -B10.10.2.$realipnum -b 100K -t180 > /users/jivey/temp-$portnum.log &"
        ssh -f jivey@pc1.geni.kettering.edu -p 30271 "sudo tcpdump -i any udp and src 10.10.2.$realipnum and dst 10.10.1.3 &> /users/jivey/tcpdump-$portnum.log &"
    done
done

#
# Start UDP clients (Host 3-5 to 1-1-1)
#
for port in 45000
do
    for ipnum in {1..4}
    do
        let portnum=$port+$ipnum+200
        let realipnum=32+$ipnum
        ssh -f jivey@pc5.geni.kettering.edu -p 30268 "iperf -u -l1400 -c 10.10.1.4 -p$portnum -B10.10.3.$realipnum -b 100K -t180 > /users/jivey/temp-$portnum.log &"
        ssh -f jivey@pc5.geni.kettering.edu -p 30268 "sudo tcpdump -i any udp and src 10.10.3.$realipnum and dst 10.10.1.4 &> /users/jivey/tcpdump-$portnum.log &"
    done
done

echo "Clients transmitting"

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
    for port in 45000
    do
        for ipnum in {1..4}
        do
            let portnum=$port+$ipnum
            ssh jivey@pc1.geni.kettering.edu -p 30266 "cat /users/jivey/temp-$portnum.log" >> logs/iperfs/iperfs-$language-$logtype-$numflows-0-$portnum.log
            ssh jivey@pc2.geni.kettering.edu -p 30266 "cat /users/jivey/temp-$portnum.log" >> logs/iperfs/iperfs-$language-$logtype-$numflows-1-$portnum.log
            ssh jivey@pc1.geni.kettering.edu -p 30267 "cat /users/jivey/temp-$portnum.log" >> logs/iperfs/iperfs-$language-$logtype-$numflows-2-$portnum.log
            ssh jivey@pc1.geni.kettering.edu -p 30268 "cat /users/jivey/temp-$portnum.log" >> logs/iperfs/iperfs-$language-$logtype-$numflows-3-$portnum.log

            ssh jivey@pc1.geni.kettering.edu -p 30266 "cat /users/jivey/tcpdump-$portnum.log" >> logs/tcpdumps/tcpdumps-$language-$logtype-$numflows-0-$portnum.log
            ssh jivey@pc2.geni.kettering.edu -p 30266 "cat /users/jivey/tcpdump-$portnum.log" >> logs/tcpdumps/tcpdumps-$language-$logtype-$numflows-1-$portnum.log
            ssh jivey@pc1.geni.kettering.edu -p 30267 "cat /users/jivey/tcpdump-$portnum.log" >> logs/tcpdumps/tcpdumps-$language-$logtype-$numflows-2-$portnum.log
            ssh jivey@pc1.geni.kettering.edu -p 30268 "cat /users/jivey/tcpdump-$portnum.log" >> logs/tcpdumps/tcpdumps-$language-$logtype-$numflows-3-$portnum.log

            let portnum=$port+$ipnum+100
            ssh jivey@pc1.geni.kettering.edu -p 30266 "cat /users/jivey/temp-$portnum.log" >> logs/iperfs/iperfs-$language-$logtype-$numflows-0-$portnum.log
            ssh jivey@pc2.geni.kettering.edu -p 30266 "cat /users/jivey/temp-$portnum.log" >> logs/iperfs/iperfs-$language-$logtype-$numflows-1-$portnum.log
            ssh jivey@pc1.geni.kettering.edu -p 30267 "cat /users/jivey/temp-$portnum.log" >> logs/iperfs/iperfs-$language-$logtype-$numflows-2-$portnum.log
            ssh jivey@pc1.geni.kettering.edu -p 30268 "cat /users/jivey/temp-$portnum.log" >> logs/iperfs/iperfs-$language-$logtype-$numflows-3-$portnum.log

            ssh jivey@pc1.geni.kettering.edu -p 30266 "cat /users/jivey/tcpdump-$portnum.log" >> logs/tcpdumps/tcpdumps-$language-$logtype-$numflows-0-$portnum.log
            ssh jivey@pc2.geni.kettering.edu -p 30266 "cat /users/jivey/tcpdump-$portnum.log" >> logs/tcpdumps/tcpdumps-$language-$logtype-$numflows-1-$portnum.log
            ssh jivey@pc1.geni.kettering.edu -p 30267 "cat /users/jivey/tcpdump-$portnum.log" >> logs/tcpdumps/tcpdumps-$language-$logtype-$numflows-2-$portnum.log
            ssh jivey@pc1.geni.kettering.edu -p 30268 "cat /users/jivey/tcpdump-$portnum.log" >> logs/tcpdumps/tcpdumps-$language-$logtype-$numflows-3-$portnum.log

            let portnum=$port+$ipnum+200
            ssh jivey@pc1.geni.kettering.edu -p 30266 "cat /users/jivey/temp-$portnum.log" >> logs/iperfs/iperfs-$language-$logtype-$numflows-0-$portnum.log
            ssh jivey@pc2.geni.kettering.edu -p 30266 "cat /users/jivey/temp-$portnum.log" >> logs/iperfs/iperfs-$language-$logtype-$numflows-1-$portnum.log
            ssh jivey@pc1.geni.kettering.edu -p 30267 "cat /users/jivey/temp-$portnum.log" >> logs/iperfs/iperfs-$language-$logtype-$numflows-2-$portnum.log
            ssh jivey@pc1.geni.kettering.edu -p 30268 "cat /users/jivey/temp-$portnum.log" >> logs/iperfs/iperfs-$language-$logtype-$numflows-3-$portnum.log

            ssh jivey@pc1.geni.kettering.edu -p 30266 "cat /users/jivey/tcpdump-$portnum.log" >> logs/tcpdumps/tcpdumps-$language-$logtype-$numflows-0-$portnum.log
            ssh jivey@pc2.geni.kettering.edu -p 30266 "cat /users/jivey/tcpdump-$portnum.log" >> logs/tcpdumps/tcpdumps-$language-$logtype-$numflows-1-$portnum.log
            ssh jivey@pc1.geni.kettering.edu -p 30267 "cat /users/jivey/tcpdump-$portnum.log" >> logs/tcpdumps/tcpdumps-$language-$logtype-$numflows-2-$portnum.log
            ssh jivey@pc1.geni.kettering.edu -p 30268 "cat /users/jivey/tcpdump-$portnum.log" >> logs/tcpdumps/tcpdumps-$language-$logtype-$numflows-3-$portnum.log

            let portnum=$port+$ipnum
            ssh jivey@pc4.geni.kettering.edu -p 30267 "cat /users/jivey/temp-$portnum.log" >> logs/iperfc/iperfc-$language-$logtype-$numflows-0-$portnum.log
            ssh jivey@pc5.geni.kettering.edu -p 30266 "cat /users/jivey/temp-$portnum.log" >> logs/iperfc/iperfc-$language-$logtype-$numflows-1-$portnum.log
            ssh jivey@pc2.geni.kettering.edu -p 30268 "cat /users/jivey/temp-$portnum.log" >> logs/iperfc/iperfc-$language-$logtype-$numflows-2-$portnum.log
            ssh jivey@pc1.geni.kettering.edu -p 30272 "cat /users/jivey/temp-$portnum.log" >> logs/iperfc/iperfc-$language-$logtype-$numflows-3-$portnum.log

            ssh jivey@pc4.geni.kettering.edu -p 30267 "cat /users/jivey/tcpdump-$portnum.log" >> logs/tcpdumpc/tcpdumpc-$language-$logtype-$numflows-0-$portnum.log
            ssh jivey@pc5.geni.kettering.edu -p 30266 "cat /users/jivey/tcpdump-$portnum.log" >> logs/tcpdumpc/tcpdumpc-$language-$logtype-$numflows-1-$portnum.log
            ssh jivey@pc2.geni.kettering.edu -p 30268 "cat /users/jivey/tcpdump-$portnum.log" >> logs/tcpdumpc/tcpdumpc-$language-$logtype-$numflows-2-$portnum.log
            ssh jivey@pc1.geni.kettering.edu -p 30272 "cat /users/jivey/tcpdump-$portnum.log" >> logs/tcpdumpc/tcpdumpc-$language-$logtype-$numflows-3-$portnum.log

            let portnum=$port+$ipnum+100
            ssh jivey@pc1.geni.kettering.edu -p 30269 "cat /users/jivey/temp-$portnum.log" >> logs/iperfc/iperfc-$language-$logtype-$numflows-0-$portnum.log
            ssh jivey@pc1.geni.kettering.edu -p 30270 "cat /users/jivey/temp-$portnum.log" >> logs/iperfc/iperfc-$language-$logtype-$numflows-1-$portnum.log
            ssh jivey@pc5.geni.kettering.edu -p 30267 "cat /users/jivey/temp-$portnum.log" >> logs/iperfc/iperfc-$language-$logtype-$numflows-2-$portnum.log
            ssh jivey@pc3.geni.kettering.edu -p 30267 "cat /users/jivey/temp-$portnum.log" >> logs/iperfc/iperfc-$language-$logtype-$numflows-3-$portnum.log

            ssh jivey@pc1.geni.kettering.edu -p 30269 "cat /users/jivey/tcpdump-$portnum.log" >> logs/tcpdumpc/tcpdumpc-$language-$logtype-$numflows-0-$portnum.log
            ssh jivey@pc1.geni.kettering.edu -p 30270 "cat /users/jivey/tcpdump-$portnum.log" >> logs/tcpdumpc/tcpdumpc-$language-$logtype-$numflows-1-$portnum.log
            ssh jivey@pc5.geni.kettering.edu -p 30267 "cat /users/jivey/tcpdump-$portnum.log" >> logs/tcpdumpc/tcpdumpc-$language-$logtype-$numflows-2-$portnum.log
            ssh jivey@pc3.geni.kettering.edu -p 30267 "cat /users/jivey/tcpdump-$portnum.log" >> logs/tcpdumpc/tcpdumpc-$language-$logtype-$numflows-3-$portnum.log

            let portnum=$port+$ipnum+200
            ssh jivey@pc3.geni.kettering.edu -p 30266 "cat /users/jivey/temp-$portnum.log" >> logs/iperfc/iperfc-$language-$logtype-$numflows-0-$portnum.log
            ssh jivey@pc2.geni.kettering.edu -p 30267 "cat /users/jivey/temp-$portnum.log" >> logs/iperfc/iperfc-$language-$logtype-$numflows-1-$portnum.log
            ssh jivey@pc1.geni.kettering.edu -p 30271 "cat /users/jivey/temp-$portnum.log" >> logs/iperfc/iperfc-$language-$logtype-$numflows-2-$portnum.log
            ssh jivey@pc5.geni.kettering.edu -p 30268 "cat /users/jivey/temp-$portnum.log" >> logs/iperfc/iperfc-$language-$logtype-$numflows-3-$portnum.log

            ssh jivey@pc3.geni.kettering.edu -p 30266 "cat /users/jivey/tcpdump-$portnum.log" >> logs/tcpdumpc/tcpdumpc-$language-$logtype-$numflows-0-$portnum.log
            ssh jivey@pc2.geni.kettering.edu -p 30267 "cat /users/jivey/tcpdump-$portnum.log" >> logs/tcpdumpc/tcpdumpc-$language-$logtype-$numflows-1-$portnum.log
            ssh jivey@pc1.geni.kettering.edu -p 30271 "cat /users/jivey/tcpdump-$portnum.log" >> logs/tcpdumpc/tcpdumpc-$language-$logtype-$numflows-2-$portnum.log
            ssh jivey@pc5.geni.kettering.edu -p 30268 "cat /users/jivey/tcpdump-$portnum.log" >> logs/tcpdumpc/tcpdumpc-$language-$logtype-$numflows-3-$portnum.log
        done
    done
    cat .tmp/temp0 >> logs/pings/pings-subnet0-$language-$logtype-$numflows.log
    cat .tmp/temp2 >> logs/pings/pings-subnet2-$language-$logtype-$numflows.log
    cat .tmp/temp3 >> logs/pings/pings-subnet3-$language-$logtype-$numflows.log
else
    echo "Discard"
fi
rm .tmp/temp0
rm .tmp/temp2
rm .tmp/temp3
