function nodeSet = FindChildNodes(node)

n = size(node.placement,2);  board = zeros(n,n);  nodeSet = [];
row_new = node.level + 1;	% to find all possible position in next level
if row_new > n
    return
end

% translate 'node.placement' to 'board'
for i = 1:size(board,1)
   if node.placement(i) ~= 0
       board(i, node.placement(i)) = 1;
   end
end

% to avoid symmetric solution.
if row_new == 1     
    n = n/2;
end
% start at new row, 'row_new'. Try to find out all possible locations (or childNodes).
for col=1:n
	node_ = node;
	if QueenSafe(row_new, col, board) == 0
		node_.placement(row_new) = col;
		node_.parentNode = node;
		node_.childNodes = [];
		node_.visit = 0;
		node_.level = node.level + 1;
		nodeSet = [nodeSet; node_];	
	end
end