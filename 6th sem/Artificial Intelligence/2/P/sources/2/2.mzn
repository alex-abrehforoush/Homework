include "globals.mzn";
int: NUM_NODES;
int: NUM_EDGES;
array[1..NUM_EDGES,1..2] of int: edges;
array[1..NUM_NODES] of var 1..4: colors;
array[1..NUM_NODES] of bool: S1;
array[1..NUM_NODES] of bool: S2;
array[1..NUM_NODES] of bool: S3;
array[1..NUM_NODES] of bool: S4;

constraint forall(i in 1..NUM_NODES)(
  S1[i] = (colors[i] == 1)
);
constraint forall(i in 1..NUM_NODES)(
  S2[i] = (colors[i] == 2)
);
constraint forall(i in 1..NUM_NODES)(
  S3[i] = (colors[i] == 3)
);
constraint forall(i in 1..NUM_NODES)(
  S4[i] = (colors[i] == 4)
);

int: SUM_1 = sum(bool2int(S1));
int: SUM_2 = sum(bool2int(S2));
int: SUM_3 = sum(bool2int(S3));
int: SUM_4 = sum(bool2int(S4));



constraint (SUM_1 >= SUM_2 /\ SUM_2 >= SUM_3 /\ SUM_3 >= SUM_4);
constraint forall(i in 1..NUM_EDGES )(colors[edges[i, 1]] != colors[edges[i, 2]]);

solve satisfy;
output[show(colors)];