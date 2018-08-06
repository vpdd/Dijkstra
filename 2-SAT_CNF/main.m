% This example is 2-SAT CNF problem as follows,
% 	C1 AND C2 AND ... AND C_{n-1}, where C_i = x_j OR x_{j+1}
% Construct cluase matrix A=(a_ij), for given clause i
%	- a_ij = 1, when x_j \in C_i
%	- a_ij = 0, when x_j not \in C_i, and ~x_j not \in C_i
%	- a_ij = -1, when ~x_j \in C_i
% Goal: count the number of valid assigments.
clc,clear

B = 2;              % budeget
N = 1000;           % repeatition
m = 10;             % the number of clauses
n = m + 1;          % the number of literals       

root.assig = [];  root.cost = 0; 
% For this problem, we can construct clause matrix A as follows.
A = [eye(m),zeros(m,1)] + [zeros(m,1),eye(m)]; 

estHist = []; t = cputime;
% repeat N times
for i = 1:N     
    % initilization
	D = 1; 	X = root;   C = root.cost;
	SX = findNextChild(X, A);			
	HX = collectionHyperChild(SX);
    
    while isempty(SX) ~= 1
        D = numel(SX)*D/numel(X);
        X = randomChooseHyperChild(HX, B);
        C = C + sumCost(X)*D/numel(X);
        SX = findNextChild(X, A);
        HX = collectionHyperChild(SX);	
    end    
    estHist = [estHist; C];
end
Time = cputime-t;
RE = std(estHist)/(mean(estHist)*sqrt(N));
fprintf('Expectation of SE estimator C is %.2f. Variance is %.2f. RE is %.6f\n',...
    mean(estHist), var(estHist), RE)
fprintf('CPU time: %.2f\n', Time)
