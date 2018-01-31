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
#1st parameter: the name of the problem (DTLZ1, WFG5, ...).
#2nd parameter: the dimension of the problem (the number of objectives).
#3rd parameter: number of random Pareto optimal solutions to generate.
#4th parameter: the step for each objective to generate a smaller number of solutions applying the epsilon-dominance.
#5th parameter: the output file where the Pareto optimal front will be stored.
#
#Example: ./ParetoFrontsGeneration.sh DTLZ1 3 100000 0.01 ../pf/DTLZ1.15D.pf
#It generates 100,000 random optimal solutions for the three-objective version of the DTLZ1 problem and add them to an epsilon-dominance archive with epsilons set to (0.01, 0.01, 0.01).

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
