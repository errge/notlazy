#!/bin/bash

set -e

proc() {
  cat $1 | tail -n1 | cut -d\  -f19,23 | tr ' ' '+'
}

cd ghchead
for i in * ; do
  e=`proc $i`
  m=`proc ../nofulllazy/$i`
  calc -p "printf('$i %06d %06f %06f\n', round(log(($m)/($e))/log(10) * 100), $e, $m)"
done | grep -v Error | sort -n -k2 >../results_cpu
