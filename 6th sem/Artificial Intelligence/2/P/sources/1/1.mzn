% Input Parameters (values for these specified in .dzn data file)
int: NUM_NODES; 
int: NUM_EDGES;
array[1..NUM_EDGES,1..2] of int: edges;

% Decision Variable: the solver will find the values of these
array[1..NUM_NODES] of var int: population;

constraint forall(v in 1..NUM_NODES)(population[v] >= 0);
% Our Constraints
constraint forall(e in 1..NUM_EDGES)(abs(population[edges[e,1]] - population[edges[e,2]]) >= 2000);

%constraint forall(e in 1..NUM_EDGES)(population[edges[e,1]] <= 3 * population[edges[e,2]] /\ population[edges[e,2]] <= 3 * population[edges[e,1]]);
%constraint forall(i,j in 1..NUM_NODES where i!=j)(population[edges[i,1]] <= 3 * population[edges[j,1]] /\ population[edges[i,1]] <= 3 * population[edges[j,2]] /\ population[edges[i,2]] <= 3 * population[edges[j,1]] /\ population[edges[i,2]] <= 3 * population[edges[j,2]]);
%constraint forall(a,b in 1..NUM_NODES-1 where a != b)(population[a] <= 3 * population[b]);

%constraint forall(i in 1..NUM_NODES)(forall(j in 1..NUM_NODES)( population[edges[i,1]] <= 3 * population[edges[j,1]] /\ population[edges[i,1]] <= 3 * population[edges[j,2]] /\ population[edges[i,2]] <= 3 * population[edges[j,1]] /\ population[edges[i,2]] <= 3 * population[edges[j,2]]));

constraint max(population) < 3* min(population);


% Our Objective Function
solve satisfy;
output[show(population)];