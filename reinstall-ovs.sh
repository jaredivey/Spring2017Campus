#! /bin/bash
let ctrl=2
ssh jivey@pc2.geni.kettering.edu -f -p 30269 "sudo bash /local/geni-install-files/install-ovs-deps.sh $ctrl"
let ctrl+=4
ssh jivey@pc2.geni.kettering.edu -f -p 30270 "sudo bash /local/geni-install-files/install-ovs-deps.sh $ctrl"
let ctrl+=4
ssh jivey@pc4.geni.kettering.edu -f -p 30268 "sudo bash /local/geni-install-files/install-ovs-deps.sh $ctrl"
let ctrl+=4
ssh jivey@pc1.geni.kettering.edu -f -p 30273 "sudo bash /local/geni-install-files/install-ovs-deps.sh $ctrl"
let ctrl+=4
ssh jivey@pc1.geni.kettering.edu -f -p 30274 "sudo bash /local/geni-install-files/install-ovs-deps.sh $ctrl"
let ctrl+=4
ssh jivey@pc2.geni.kettering.edu -f -p 30271 "sudo bash /local/geni-install-files/install-ovs-deps.sh $ctrl"
let ctrl+=4
ssh jivey@pc5.geni.kettering.edu -f -p 30269 "sudo bash /local/geni-install-files/install-ovs-deps.sh $ctrl"
let ctrl+=4
ssh jivey@pc4.geni.kettering.edu -f -p 30269 "sudo bash /local/geni-install-files/install-ovs-deps.sh $ctrl"
let ctrl+=4
ssh jivey@pc5.geni.kettering.edu -f -p 30270 "sudo bash /local/geni-install-files/install-ovs-deps.sh $ctrl"
let ctrl+=4
ssh jivey@pc1.geni.kettering.edu -f -p 30275 "sudo bash /local/geni-install-files/install-ovs-deps.sh $ctrl"
let ctrl+=4
ssh jivey@pc5.geni.kettering.edu -f -p 30271 "sudo bash /local/geni-install-files/install-ovs-deps.sh $ctrl"
let ctrl+=4
ssh jivey@pc3.geni.kettering.edu -f -p 30268 "sudo bash /local/geni-install-files/install-ovs-deps.sh $ctrl"
let ctrl+=4
ssh jivey@pc2.geni.kettering.edu -f -p 30272 "sudo bash /local/geni-install-files/install-ovs-deps.sh $ctrl"
let ctrl+=4
ssh jivey@pc5.geni.kettering.edu -f -p 30272 "sudo bash /local/geni-install-files/install-ovs-deps.sh $ctrl"
let ctrl+=4
ssh jivey@pc5.geni.kettering.edu -f -p 30273 "sudo bash /local/geni-install-files/install-ovs-deps.sh $ctrl"
let ctrl+=4
ssh jivey@pc3.geni.kettering.edu -f -p 30269 "sudo bash /local/geni-install-files/install-ovs-deps.sh $ctrl"
let ctrl+=4
ssh jivey@pc2.geni.kettering.edu -f -p 30273 "sudo bash /local/geni-install-files/install-ovs-deps.sh $ctrl"
let ctrl+=4
ssh jivey@pc2.geni.kettering.edu -f -p 30274 "sudo bash /local/geni-install-files/install-ovs-deps.sh $ctrl"
