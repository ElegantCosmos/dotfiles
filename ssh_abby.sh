#!/bin/bash
ssh -L 8888:localhost:8888 -R 12345:localhost:22 mich@abby02.in.awa.tohoku.ac.jp
#ssh -X -R 12345:localhost:22 mich@abby02.in.awa.tohoku.ac.jp
