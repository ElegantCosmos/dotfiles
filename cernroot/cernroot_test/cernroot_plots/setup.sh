#!/bin/bash

### Cern-ROOT
if [[ "$HOSTNAME" == "vmUbuntuG4" ]]; then
  source ${HOME}/.opt/cernroot/root-6.22.02/bin/thisroot.sh
elif [[ "$HOSTNAME" == "kahr" ]]; then
  source ${HOME}/.opt/cernroot/root-6.22.06/bin/thisroot.sh
fi
