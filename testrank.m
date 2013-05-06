% The transition matrix
trmat = ...
[0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 1 0 2 0 0 0 0 0;
0 1 0 4 0 0 51 0 0 1 50 0 0 1 0 2 2 17 0 0 0 0 4;
0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0;
1 1 0 0 3 0 39 0 0 3 207 0 0 221 0 1 3 113 0 0 0 0 31;
0 0 0 0 1 0 0 0 0 0 10 0 0 0 0 0 0 2 0 0 0 0 0;
0 0 0 0 0 8 0 0 0 0 5 0 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 56 0 0 0 105 0 0 0 0 0 0 3 0 0 1 0 0;
0 0 0 0 0 0 0 10 0 0 2 1 0 4 0 0 0 2 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 0 4 0 0 10 0 0 0 1 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 1 6 0 0 0 0 0 0 1 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 0 7509 0 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 1 0 0 0 0 0 1 1 0 0 0 0 0 0 6 1 0 1 0 0;
0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0;
1 128 0 383 4 4 1 8 7 0 6779 4 0 811 0 0 29 80 0 1 78 0 25;
0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 0 5 0 0 1 0 0 0 0 0 0 0 0 0;
0 2 0 1 1 1 2 0 0 0 24 0 0 1 0 0 0 3 0 0 0 0 0;
2 1 2 0 4 0 3 1 0 1 221 4 0 4 1 1 0 140 3 0 8 0 2;
0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 3 9 0 1 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0;
0 0 0 3 0 0 0 0 0 0 70 2 0 7 0 0 0 6 1 0 42 0 0;
0 0 0 218 0 0 0 0 8 0 0 0 0 7283 0 0 0 0 0 0 0 0 0;
1 0 0 13 0 0 13 0 0 0 15 0 0 0 0 1 1 17 1 0 0 0 0];

% Transpose the matrix
trmat = trmat';

% Number of runs (one for each cell)
cc = matlen(trmat);

% let's measure the inactivity rank
rankpoint = 11;

% Create empty matrix
mats = size(trmat, 1);
inacmat = zeros(mats, mats);

while (cc > 0)
   nmat = trmat;
   nmat (cc) = (trmat (cc) * 1.1);
   nmat = bsxfun (@rdivide, nmat, sum (nmat));
   prv = pagerank (nmat, 0.95, 0.0001);
   inacmat (cc) = prv (rankpoint);
   cc = cc - 1;
endwhile