#! /bin/bash

language=$1

# Kill iperfs on host 2-3 and make sure they complete
ssh jivey@pc4.geni.kettering.edu -p 30267 "sudo pkill iperf"
echo "1" > .tmp/iperfc
while [ $(cat .tmp/iperfc) -gt 0 ]
do
    ssh jivey@pc4.geni.kettering.edu -p 30267 "pgrep iperf | sed '/^\s*$/d' | wc -l" > .tmp/iperfc
    sleep 1
    echo "Clients on host 2-3 still alive"
done
rm .tmp/iperfc

# Kill iperfs on host 2-4 and make sure they complete
ssh jivey@pc5.geni.kettering.edu -p 30266 "sudo pkill iperf"
echo "1" > .tmp/iperfc
while [ $(cat .tmp/iperfc) -gt 0 ]
do
    ssh jivey@pc5.geni.kettering.edu -p 30266 "pgrep iperf | sed '/^\s*$/d' | wc -l" > .tmp/iperfc
    sleep 1
    echo "Clients on host 2-4 still alive"
done
rm .tmp/iperfc

# Kill iperfs on host 2-5 and make sure they complete
ssh jivey@pc1.geni.kettering.edu -p 30269 "sudo pkill iperf"
echo "1" > .tmp/iperfc
while [ $(cat .tmp/iperfc) -gt 0 ]
do
    ssh jivey@pc1.geni.kettering.edu -p 30269 "pgrep iperf | sed '/^\s*$/d' | wc -l" > .tmp/iperfc
    sleep 1
    echo "Clients on host 2-5 still alive"
done
rm .tmp/iperfc

# Kill iperfs on host 2-6 and make sure they complete
ssh jivey@pc1.geni.kettering.edu -p 30270 "sudo pkill iperf"
echo "1" > .tmp/iperfc
while [ $(cat .tmp/iperfc) -gt 0 ]
do
    ssh jivey@pc1.geni.kettering.edu -p 30270 "pgrep iperf | sed '/^\s*$/d' | wc -l" > .tmp/iperfc
    sleep 1
    echo "Clients on host 2-6 still alive"
done
rm .tmp/iperfc

# Kill iperfs on host 2-7 and make sure they complete
ssh jivey@pc3.geni.kettering.edu -p 30266 "sudo pkill iperf"
echo "1" > .tmp/iperfc
while [ $(cat .tmp/iperfc) -gt 0 ]
do
    ssh jivey@pc3.geni.kettering.edu -p 30266 "pgrep iperf | sed '/^\s*$/d' | wc -l" > .tmp/iperfc
    sleep 1
    echo "Clients on host 2-7 still alive"
done
rm .tmp/iperfc

# Kill iperfs on host 2-8 and make sure they complete
ssh jivey@pc2.geni.kettering.edu -p 30267 "sudo pkill iperf"
echo "1" > .tmp/iperfc
while [ $(cat .tmp/iperfc) -gt 0 ]
do
    ssh jivey@pc2.geni.kettering.edu -p 30267 "pgrep iperf | sed '/^\s*$/d' | wc -l" > .tmp/iperfc
    sleep 1
    echo "Clients on host 2-8 still alive"
done
rm .tmp/iperfc

# Kill iperfs on host 2-9 and make sure they complete
ssh jivey@pc1.geni.kettering.edu -p 30271 "sudo pkill iperf"
echo "1" > .tmp/iperfc
while [ $(cat .tmp/iperfc) -gt 0 ]
do
    ssh jivey@pc1.geni.kettering.edu -p 30271 "pgrep iperf | sed '/^\s*$/d' | wc -l" > .tmp/iperfc
    sleep 1
    echo "Clients on host 2-9 still alive"
done
rm .tmp/iperfc

# Kill iperfs on host 3-1 and make sure they complete
ssh jivey@pc2.geni.kettering.edu -p 30268 "sudo pkill iperf"
echo "1" > .tmp/iperfc
while [ $(cat .tmp/iperfc) -gt 0 ]
do
    ssh jivey@pc2.geni.kettering.edu -p 30268 "pgrep iperf | sed '/^\s*$/d' | wc -l" > .tmp/iperfc
    sleep 1
    echo "Clients on host 3-1 still alive"
done
rm .tmp/iperfc

# Kill iperfs on host 3-2 and make sure they complete
ssh jivey@pc1.geni.kettering.edu -p 30272 "sudo pkill iperf"
echo "1" > .tmp/iperfc
while [ $(cat .tmp/iperfc) -gt 0 ]
do
    ssh jivey@pc1.geni.kettering.edu -p 30272 "pgrep iperf | sed '/^\s*$/d' | wc -l" > .tmp/iperfc
    sleep 1
    echo "Clients on host 3-2 still alive"
done
rm .tmp/iperfc

# Kill iperfs on host 3-3 and make sure they complete
ssh jivey@pc5.geni.kettering.edu -p 30267 "sudo pkill iperf"
echo "1" > .tmp/iperfc
while [ $(cat .tmp/iperfc) -gt 0 ]
do
    ssh jivey@pc5.geni.kettering.edu -p 30267 "pgrep iperf | sed '/^\s*$/d' | wc -l" > .tmp/iperfc
    sleep 1
    echo "Clients on host 3-3 still alive"
done
rm .tmp/iperfc

# Kill iperfs on host 3-4 and make sure they complete
ssh jivey@pc3.geni.kettering.edu -p 30267 "sudo pkill iperf"
echo "1" > .tmp/iperfc
while [ $(cat .tmp/iperfc) -gt 0 ]
do
    ssh jivey@pc3.geni.kettering.edu -p 30267 "pgrep iperf | sed '/^\s*$/d' | wc -l" > .tmp/iperfc
    sleep 1
    echo "Clients on host 3-4 still alive"
done
rm .tmp/iperfc

# Kill iperfs on host 3-5 and make sure they complete
ssh jivey@pc5.geni.kettering.edu -p 30268 "sudo pkill iperf"
echo "1" > .tmp/iperfc
while [ $(cat .tmp/iperfc) -gt 0 ]
do
    ssh jivey@pc5.geni.kettering.edu -p 30268 "pgrep iperf | sed '/^\s*$/d' | wc -l" > .tmp/iperfc
    sleep 1
    echo "Clients on host 3-5 still alive"
done
rm .tmp/iperfc

sleep 5

# Kill tcpdumps on host 2-3 and make sure they complete
ssh jivey@pc4.geni.kettering.edu -p 30267 "sudo pkill -2 tcpdump"
echo "1" > .tmp/tcpdumpc
while [ $(cat .tmp/tcpdumpc) -gt 0 ]
do
    ssh jivey@pc4.geni.kettering.edu -p 30267 "pgrep tcpdump | sed '/^\s*$/d' | wc -l" > .tmp/tcpdumpc
    sleep 1
    echo "Tcpdumps on host 2-3 still alive"
done
rm .tmp/tcpdumpc

# Kill tcpdumps on host 2-4 and make sure they complete
ssh jivey@pc5.geni.kettering.edu -p 30266 "sudo pkill -2 tcpdump"
echo "1" > .tmp/tcpdumpc
while [ $(cat .tmp/tcpdumpc) -gt 0 ]
do
    ssh jivey@pc5.geni.kettering.edu -p 30266 "pgrep tcpdump | sed '/^\s*$/d' | wc -l" > .tmp/tcpdumpc
    sleep 1
    echo "Tcpdumps on host 2-4 still alive"
done
rm .tmp/tcpdumpc

# Kill tcpdumps on host 2-5 and make sure they complete
ssh jivey@pc1.geni.kettering.edu -p 30269 "sudo pkill -2 tcpdump"
echo "1" > .tmp/tcpdumpc
while [ $(cat .tmp/tcpdumpc) -gt 0 ]
do
    ssh jivey@pc1.geni.kettering.edu -p 30269 "pgrep tcpdump | sed '/^\s*$/d' | wc -l" > .tmp/tcpdumpc
    sleep 1
    echo "Tcpdumps on host 2-5 still alive"
done
rm .tmp/tcpdumpc

# Kill tcpdumps on host 2-6 and make sure they complete
ssh jivey@pc1.geni.kettering.edu -p 30270 "sudo pkill -2 tcpdump"
echo "1" > .tmp/tcpdumpc
while [ $(cat .tmp/tcpdumpc) -gt 0 ]
do
    ssh jivey@pc1.geni.kettering.edu -p 30270 "pgrep tcpdump | sed '/^\s*$/d' | wc -l" > .tmp/tcpdumpc
    sleep 1
    echo "Tcpdumps on host 2-6 still alive"
done
rm .tmp/tcpdumpc

# Kill tcpdumps on host 2-7 and make sure they complete
ssh jivey@pc3.geni.kettering.edu -p 30266 "sudo pkill -2 tcpdump"
echo "1" > .tmp/tcpdumpc
while [ $(cat .tmp/tcpdumpc) -gt 0 ]
do
    ssh jivey@pc3.geni.kettering.edu -p 30266 "pgrep tcpdump | sed '/^\s*$/d' | wc -l" > .tmp/tcpdumpc
    sleep 1
    echo "Tcpdumps on host 2-7 still alive"
done
rm .tmp/tcpdumpc

# Kill tcpdumps on host 2-8 and make sure they complete
ssh jivey@pc2.geni.kettering.edu -p 30267 "sudo pkill -2 tcpdump"
echo "1" > .tmp/tcpdumpc
while [ $(cat .tmp/tcpdumpc) -gt 0 ]
do
    ssh jivey@pc2.geni.kettering.edu -p 30267 "pgrep tcpdump | sed '/^\s*$/d' | wc -l" > .tmp/tcpdumpc
    sleep 1
    echo "Tcpdumps on host 2-8 still alive"
done
rm .tmp/tcpdumpc

# Kill tcpdumps on host 2-9 and make sure they complete
ssh jivey@pc1.geni.kettering.edu -p 30271 "sudo pkill -2 tcpdump"
echo "1" > .tmp/tcpdumpc
while [ $(cat .tmp/tcpdumpc) -gt 0 ]
do
    ssh jivey@pc1.geni.kettering.edu -p 30271 "pgrep tcpdump | sed '/^\s*$/d' | wc -l" > .tmp/tcpdumpc
    sleep 1
    echo "Tcpdumps on host 2-9 still alive"
done
rm .tmp/tcpdumpc

# Kill tcpdumps on host 3-1 and make sure they complete
ssh jivey@pc2.geni.kettering.edu -p 30268 "sudo pkill -2 tcpdump"
echo "1" > .tmp/tcpdumpc
while [ $(cat .tmp/tcpdumpc) -gt 0 ]
do
    ssh jivey@pc2.geni.kettering.edu -p 30268 "pgrep tcpdump | sed '/^\s*$/d' | wc -l" > .tmp/tcpdumpc
    sleep 1
    echo "Tcpdumps on host 3-1 still alive"
done
rm .tmp/tcpdumpc

# Kill tcpdumps on host 3-2 and make sure they complete
ssh jivey@pc1.geni.kettering.edu -p 30272 "sudo pkill -2 tcpdump"
echo "1" > .tmp/tcpdumpc
while [ $(cat .tmp/tcpdumpc) -gt 0 ]
do
    ssh jivey@pc1.geni.kettering.edu -p 30272 "pgrep tcpdump | sed '/^\s*$/d' | wc -l" > .tmp/tcpdumpc
    sleep 1
    echo "Tcpdumps on host 3-2 still alive"
done
rm .tmp/tcpdumpc

# Kill tcpdumps on host 3-3 and make sure they complete
ssh jivey@pc5.geni.kettering.edu -p 30267 "sudo pkill -2 tcpdump"
echo "1" > .tmp/tcpdumpc
while [ $(cat .tmp/tcpdumpc) -gt 0 ]
do
    ssh jivey@pc5.geni.kettering.edu -p 30267 "pgrep tcpdump | sed '/^\s*$/d' | wc -l" > .tmp/tcpdumpc
    sleep 1
    echo "Tcpdumps on host 3-3 still alive"
done
rm .tmp/tcpdumpc

# Kill tcpdumps on host 3-4 and make sure they complete
ssh jivey@pc3.geni.kettering.edu -p 30267 "sudo pkill -2 tcpdump"
echo "1" > .tmp/tcpdumpc
while [ $(cat .tmp/tcpdumpc) -gt 0 ]
do
    ssh jivey@pc3.geni.kettering.edu -p 30267 "pgrep tcpdump | sed '/^\s*$/d' | wc -l" > .tmp/tcpdumpc
    sleep 1
    echo "Tcpdumps on host 3-4 still alive"
done
rm .tmp/tcpdumpc

# Kill tcpdumps on host 3-5 and make sure they complete
ssh jivey@pc5.geni.kettering.edu -p 30268 "sudo pkill -2 tcpdump"
echo "1" > .tmp/tcpdumpc
while [ $(cat .tmp/tcpdumpc) -gt 0 ]
do
    ssh jivey@pc5.geni.kettering.edu -p 30268 "pgrep tcpdump | sed '/^\s*$/d' | wc -l" > .tmp/tcpdumpc
    sleep 1
    echo "Tcpdumps on host 3-5 still alive"
done
rm .tmp/tcpdumpc

sleep 5

# Kill iperfs on host 1-0-0 and make sure they complete
echo "1" > .tmp/iperfs
while [ $(cat .tmp/iperfs) -gt 0 ]
do
    ssh jivey@pc1.geni.kettering.edu -p 30266 "sudo pkill iperf"
    sleep 1
    ssh jivey@pc1.geni.kettering.edu -p 30266 "pgrep iperf | sed '/^\s*$/d' | wc -l" > .tmp/iperfs
    echo "Servers on host 1-0-0 still alive"
done
rm .tmp/iperfs

# Kill iperfs on host 1-0-1 and make sure they complete
echo "1" > .tmp/iperfs
while [ $(cat .tmp/iperfs) -gt 0 ]
do
    ssh jivey@pc2.geni.kettering.edu -p 30266 "sudo pkill iperf"
    sleep 1
    ssh jivey@pc2.geni.kettering.edu -p 30266 "pgrep iperf | sed '/^\s*$/d' | wc -l" > .tmp/iperfs
    echo "Servers on host 1-0-1 still alive"
done
rm .tmp/iperfs

# Kill iperfs on host 1-1-0 and make sure they complete
echo "1" > .tmp/iperfs
while [ $(cat .tmp/iperfs) -gt 0 ]
do
    ssh jivey@pc1.geni.kettering.edu -p 30267 "sudo pkill iperf"
    sleep 1
    ssh jivey@pc1.geni.kettering.edu -p 30267 "pgrep iperf | sed '/^\s*$/d' | wc -l" > .tmp/iperfs
    echo "Servers on host 1-1-0 still alive"
done
rm .tmp/iperfs

# Kill iperfs on host 1-1-1 and make sure they complete
echo "1" > .tmp/iperfs
while [ $(cat .tmp/iperfs) -gt 0 ]
do
    ssh jivey@pc1.geni.kettering.edu -p 30268 "sudo pkill iperf"
    sleep 1
    ssh jivey@pc1.geni.kettering.edu -p 30268 "pgrep iperf | sed '/^\s*$/d' | wc -l" > .tmp/iperfs
    echo "Servers on host 1-1-1 still alive"
done
rm .tmp/iperfs

sleep 5

# Kill tcpdumps on host 1-0-0 and make sure they complete
ssh jivey@pc1.geni.kettering.edu -p 30266 "sudo pkill -2 tcpdump"
echo "1" > .tmp/tcpdumps
while [ $(cat .tmp/tcpdumps) -gt 0 ]
do
    ssh jivey@pc1.geni.kettering.edu -p 30266 "pgrep tcpdump | sed '/^\s*$/d' | wc -l" > .tmp/tcpdumps
    sleep 1
    echo "Tcpdumps on host 1-0-0 still alive"
done
rm .tmp/tcpdumps

# Kill tcpdumps on host 1-0-1 and make sure they complete
ssh jivey@pc2.geni.kettering.edu -p 30266 "sudo pkill -2 tcpdump"
echo "1" > .tmp/tcpdumps
while [ $(cat .tmp/tcpdumps) -gt 0 ]
do
    ssh jivey@pc2.geni.kettering.edu -p 30266 "pgrep tcpdump | sed '/^\s*$/d' | wc -l" > .tmp/tcpdumps
    sleep 1
    echo "Tcpdumps on host 1-0-1 still alive"
done
rm .tmp/tcpdumps

# Kill tcpdumps on host 1-1-0 and make sure they complete
ssh jivey@pc1.geni.kettering.edu -p 30267  "sudo pkill -2 tcpdump"
echo "1" > .tmp/tcpdumps
while [ $(cat .tmp/tcpdumps) -gt 0 ]
do
    ssh jivey@pc1.geni.kettering.edu -p 30267 "pgrep tcpdump | sed '/^\s*$/d' | wc -l" > .tmp/tcpdumps
    sleep 1
    echo "Tcpdumps on host 1-1-0 still alive"
done
rm .tmp/tcpdumps

# Kill tcpdumps on host 1-1-1 and make sure they complete
ssh jivey@pc1.geni.kettering.edu -p 30268 "sudo pkill -2 tcpdump"
echo "1" > .tmp/tcpdumps
while [ $(cat .tmp/tcpdumps) -gt 0 ]
do
    ssh jivey@pc1.geni.kettering.edu -p 30268 "pgrep tcpdump | sed '/^\s*$/d' | wc -l" > .tmp/tcpdumps
    sleep 1
    echo "Tcpdumps on host 1-1-1 still alive"
done
rm .tmp/tcpdumps

sleep 5

# Kill controller
let stall=0
if [ $language == "python" ]
then
    ssh jivey@pc4.geni.kettering.edu -p 30266 "sudo pkill -2 python"
    echo "1" > .tmp/procpython
    while [ $(cat .tmp/procpython) -gt 0 ]
    do
        ssh jivey@pc4.geni.kettering.edu -p 30266 "pgrep python | sed '/^\s*$/d' | wc -l" > .tmp/procpython
        sleep 1
        echo "Ryu still active"
        let stall+=1
        if [ $stall -ge 10 ]
        then
            ssh jivey@pc4.geni.kettering.edu -p 30266 "sudo pkill -2 python"
            let stall=0
        fi
    done
    rm .tmp/procpython
else
    ssh jivey@pc4.geni.kettering.edu -p 30266 "sudo pkill -2 java"
    echo "1" > .tmp/procjava
    while [ $(cat .tmp/procjava) -gt 0 ]
    do
        ssh jivey@pc4.geni.kettering.edu -p 30266 "pgrep java | sed '/^\s*$/d' | wc -l" > .tmp/procjava
        sleep 1
        echo "Floodlight still active"
        let stall+=1
        if [ $stall -ge 10 ]
        then
            ssh jivey@pc4.geni.kettering.edu -p 30266 "sudo pkill -2 python"
            let stall=0
        fi
    done
    rm .tmp/procjava
fi

# Empty flow tables
bash ovs-ssh.sh "sudo ovs-ofctl del-flows br0"
