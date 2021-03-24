#!/bin/bash

graph=$1

line=$(head -n 1 $graph)

graph_info=($line)

V=${graph_info[0]}
E=${graph_info[1]}

vertices="["$(seq -s , $V)"]"

edges="["
while read -r line 
do
  e=($line)
  u=${e[0]}
  v=${e[1]}
  edges=$edges"edge($u,$v),"
done < <(tail -n +2 $1)
edges=${edges%?}"]"
echo $edges

prolog_query="color_graph(ColorMap, "$vertices", "$edges")"
echo $prolog_query

gprolog --consult-file coloring.pro --query-goal "$prolog_query"
