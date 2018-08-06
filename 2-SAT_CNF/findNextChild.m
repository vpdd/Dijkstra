function SX = findNextChild(X,A)
% find all child node
%   - X: current hyper-vertex
%   - A: clause matrix

[m,n] = size(A);  SX = [];	% to store all child nodes

if length(X(1).assig) <= n-1
	for i=1:numel(X)
        node1 = X(i);
		node1.assig = [node1.assig, 0];
        node1.cost = SAT(node1.assig, A);
        SX = [SX; node1];
        
        node2 = X(i);
        node2.assig = [node2.assig, 1];
        node2.cost = SAT(node2.assig, A);
        SX = [SX; node2];
	end
else
	SX = [];
end