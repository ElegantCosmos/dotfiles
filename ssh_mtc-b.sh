#!/bin/sh
#ssh mich@128.171.30.50
ssh -L 8888:localhost:8888 -R 12345:localhost:22 -X mich@mtc-b.phys.hawaii.edu
#ssh -X mich@mtc-b.phys.hawaii.edu
