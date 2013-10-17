#!/bin/bash

set -e

proc() {
  cat $1 | tail -n1 | cut -d\  -f12 | tr -d M
}

cd ghchead
for i in * ; do
  e=`proc $i`
  m=`proc ../nofulllazy/$i`
  calc -p "printf('$i %06f %06f %06f', round(log(($m)/($e))/log(10) * 100), $e, $m)"
  echo
done | sort -n -k2 >../results_mem
