This code is written in Prolog and brute forces the solution.

To make things easier I made a planarColoring.sh script that takes in the graph file

bash planarColoring.sh graph.txt

This will do some preprocessing in bash, compile and load the prolog file, and pass the correct query.
It will be slow and will still be in the Prolog shell after computing the coloring.
After the computation is done, hit Enter and CTL+D to exit the interpreter.
