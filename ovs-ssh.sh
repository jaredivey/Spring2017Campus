#! /bin/bash
echo "bash ovs-ssh $1 $2"
ssh jivey@pc2.geni.kettering.edu -p 30269 $1 $2
ssh jivey@pc2.geni.kettering.edu -p 30270 $1 $2
ssh jivey@pc4.geni.kettering.edu -p 30268 $1 $2
ssh jivey@pc1.geni.kettering.edu -p 30273 $1 $2
ssh jivey@pc1.geni.kettering.edu -p 30274 $1 $2
ssh jivey@pc2.geni.kettering.edu -p 30271 $1 $2
ssh jivey@pc5.geni.kettering.edu -p 30269 $1 $2
ssh jivey@pc4.geni.kettering.edu -p 30269 $1 $2
ssh jivey@pc5.geni.kettering.edu -p 30270 $1 $2
ssh jivey@pc1.geni.kettering.edu -p 30275 $1 $2
ssh jivey@pc5.geni.kettering.edu -p 30271 $1 $2
ssh jivey@pc3.geni.kettering.edu -p 30268 $1 $2
ssh jivey@pc2.geni.kettering.edu -p 30272 $1 $2
ssh jivey@pc5.geni.kettering.edu -p 30272 $1 $2
ssh jivey@pc5.geni.kettering.edu -p 30273 $1 $2
ssh jivey@pc3.geni.kettering.edu -p 30269 $1 $2
ssh jivey@pc2.geni.kettering.edu -p 30273 $1 $2
ssh jivey@pc2.geni.kettering.edu -p 30274 $1 $2
