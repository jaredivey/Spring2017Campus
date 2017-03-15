#! /bin/bash

###############################################################################
# Zero flow tests
###############################################################################
: '
for num in {1..15}
do
    bash run-pings-no-flows.sh java fl-nix nix unused 0 auto
done
for num in {1..15}
do
    bash run-pings-no-flows.sh java fl-def empty unused 0 auto
done
'
###############################################################################
# One flow tests
###############################################################################
for num in {1..15}
do
    bash run-pings-1-flow.sh java fl-nix nix unused 1 auto
done
for num in {1..15}
do
    bash run-pings-1-flow.sh java fl-def empty unused 1 auto
done

###############################################################################
# Two flow tests
###############################################################################
for num in {1..15}
do
    bash run-pings-2-flows.sh java fl-nix nix unused 2 auto
done
for num in {1..15}
do
    bash run-pings-2-flows.sh java fl-def empty unused 2 auto
done

###############################################################################
# Three flow tests
###############################################################################

for num in {1..15}
do
    bash run-pings-3-flows.sh java fl-nix nix unused 3 auto
done
for num in {1..15}
do
    bash run-pings-3-flows.sh java fl-def empty unused 3 auto
done
