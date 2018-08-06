function sum = sumCost(X)
% check all assignments in setX, 
%	- if x satisfies all clauses are satisfied, C = 1;
%	- otherwise, C = 0;
sum = 0;
for i = 1: length(X)
	sum = sum + X(i).cost;
end