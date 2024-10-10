#!/usr/bin/env bash

export SPEC="secrets.nix"
echo "{ \"secrets/$1.age\".publicKeys = [ \"$(cat $2)\" ]; }" > $SPEC

agenix -e secrets/$1.age -i $3
