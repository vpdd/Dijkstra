function flg = SAT(x,A)
% Aim: for any given assignment x, return satisfy all clauses or not.
% Input:
%	- x: candidate assignment
% Output:
%	- flg: 1, satisfy all cluases; 0, not satisfy all.

[m,n] = size(A);

if length(x) == n
    Cmatrix = [zeros(m,1), repmat((2*x-1),m,1).*A];
    tmp = cumsum(max(Cmatrix,[],2));
    satisfyClause = tmp(m,1);

    % check whether the current assignment satisfies all clauses or not
    if length(find(satisfyClause == m)) == 1
        flg = 1;
    else
        flg = 0;
    end
else 
    flg = 0;
end
