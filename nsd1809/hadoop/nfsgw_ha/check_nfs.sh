#!/bin/bash
while read pid name;do
  [[ "Nfs3" == "${name}" ]] && break; 
done <<<"$(jps)"
((${pid:-0})) && exit $(kill -0 ${pid} 2>/dev/null) || exit 1
