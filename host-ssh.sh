#! /bin/bash

# "LANs"
ssh jivey@pc4.geni.kettering.edu -p 30267 $1
ssh jivey@pc5.geni.kettering.edu -p 30266 $1
ssh jivey@pc1.geni.kettering.edu -p 30269 $1
ssh jivey@pc1.geni.kettering.edu -p 30270 $1
ssh jivey@pc3.geni.kettering.edu -p 30266 $1
ssh jivey@pc2.geni.kettering.edu -p 30267 $1
ssh jivey@pc1.geni.kettering.edu -p 30271 $1
ssh jivey@pc2.geni.kettering.edu -p 30268 $1
ssh jivey@pc1.geni.kettering.edu -p 30272 $1
ssh jivey@pc5.geni.kettering.edu -p 30267 $1
ssh jivey@pc3.geni.kettering.edu -p 30267 $1
ssh jivey@pc5.geni.kettering.edu -p 30268 $1

# Servers
ssh jivey@pc1.geni.kettering.edu -p 30266 $1
ssh jivey@pc2.geni.kettering.edu -p 30266 $1
ssh jivey@pc1.geni.kettering.edu -p 30267 $1
ssh jivey@pc1.geni.kettering.edu -p 30268 $1
