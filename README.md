# Pareto fronts generation
A Bash script to generate Pareto optimal fronts of multiobjective optimization problems implementing the AnalytcalProblem interface in the MOEA framework (http://moeaframework.org/). Thus, this script can be easily used to generate the Pareto optimal front of the DTLZ and WFG problems for any number of objective funtions.

The script has the following five parameters:

- 1st parameter: the name of the problem (DTLZ1, WFG5, ...).
- 2nd parameter: the dimension of the problem (the number of objectives).
- 3rd parameter: number of random Pareto optimal solutions to generate.
- 4th parameter: the step for each objective to generate a smaller number of solutions applying the epsilon-dominance.
- 5th parameter: the output file where the Pareto optimal front will be stored.

It uses the default values of decision variables for the DTLZ problems:

- DTLZ1 (number of objectives + 4).
- DTLZ2-DTLZ4 (number of objectives + 9).
- DTLZ7 (number of objectives + 19).

It also uses the default moeaframework values for the position-related (k) and distance-related (l) variables for the WFG problems:

- WFG1-WFG9, k = (number of objectives - 1) and l = 10.

Requirements:

- The MOEA framework and a compatible JDK.
- The Bash script must be run from the MOEA framework root folder.

How it works:

- It generates N random optimal solutions for a given problem.
- It adds these solutions to an epsilon-dominance archive with given epsilon to compose the Pareto optimal front.
- It writes the Pareto optimal front in a file.

Example: ./ParetoFrontsGeneration.sh DTLZ1 3 100000 0.01 ../pf/DTLZ1.15D.pf

- It generates 100,000 random optimal solutions for the three-objective version of the DTLZ1 problem and add them to an epsilon-dominance archive with epsilons set to (0.01, 0.01, 0.01).

What it is available in this repository:

- A Bash script to generate Pareto fronts using the MOEA framework.
- The DTLZ1, DTLZ2, DTLZ3, DTLZ4, and DTLZ7 Pareto optimal front for five, 10, and 15 objective functions.
- The WFG Pareto optimal fronts for four, five, six, eight, 10, and 15 objective functions.

NOTE: epsilon values has been adjusted to generate the approximation of the true Pareto optimal fronts using 1,000 points.
