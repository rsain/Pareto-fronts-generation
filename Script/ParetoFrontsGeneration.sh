#!/bin/bash
#
#
#Author:      Rubén Saborido Infantes
#Email:       rsain@uma.es
#Description: This script allows to generate Pareto optimal fronts for multiobjective optimization problems (usually the DTLZ and WFG families)
#
#
#IMPORTANT: Remember to run this script from the MOEA framework root folder.
#
#1st parameter: the name of the problem (DTLZ1, WFG1, ...).
#2nd parameter: the dimension of the problem (the number of objectives).
#3rd parameter: number of random solutions (moeaframework will generate these random solutions and it will apply the Pareto dominance).
#4th parameter: the step for each objective (it limites the size of the results).
#5th parameter: the output file where the reference set is saved.
#
#Example: ./ParetoFrontsGeneration.sh DTLZ1 3 100000 0.01 ../pf/DTLZ1.15D.pf

if [ "$#" -ne 5 ]; then
    echo "ERROR! This script needs the following FIVE parameters (in this order):"
    echo
    echo "PROBLEM is the name of the problem (DTLZ1, WFG1, ...)"
    echo "DIMENSION is the number of objectives"
    echo "SOLUTIONS is the number of random solutions to generate"
    echo "STEP for each objective (it limites the size of the results)"
    echo "OUTPUT file where the reference set is saved"
    echo
    exit
fi

problem=$1
dimension=$2
randomSolutions=$3
step=$4
output=$5

steps=$step
counter=1
while [  $counter -lt $dimension ]; do
	steps=$steps","$step
	let counter=counter+1 
done

instance=$problem\_$dimension
command="java -cp \".:lib/*:bin\" org.moeaframework.analysis.sensitivity.SetGenerator -b $instance -n $randomSolutions -e $steps -o $5"
echo "Running '$command'"
eval $command
numberOfSolutions=`wc -l $output | cut -d" " -f1`

echo "DONE!"
echo "The generated reference front contains $numberOfSolutions Pareto optimal solutions."
