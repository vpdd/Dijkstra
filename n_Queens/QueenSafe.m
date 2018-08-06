function flg = QueenSafe(row, col, board)

flg = 0;            % flg = 0, safe; flg = 1, unsafe
n = size(board,1); 

% 1. check all rows and all cols
for i=1:n
	if(board(row,i) ==1 || board(i,col) == 1)
		flg = 1;
		return
	end	
end

% 2. check all NW to SE direction diagonal
reset = min(row,col) - 1;  i = row-reset; j = col-reset;
for i = (row-reset):1:n
    %fprintf('\n2. row is %d. column is %d', i, j)
    if i >= 1 && i <= n && j >= 1 && j <= n && board(i,j) == 1
        flg = 1;  
        return
    end
    j = j + 1;
end

% 3. check all SW to NE direction diagonal
if row>=col
    reset = max(row,col)-1;  i = row-reset; j = col+reset;
else
    reset = min(row,col) - 1;  i = row-reset; j = col+reset;
end
for i = (row-reset):1:n 
    %fprintf('\n3. row is %d. column is %d', i, j)
    if i >= 1 && i <= n && j >= 1 && j <= n && board(i,j) == 1
        flg = 1;  
        return
    end
    j = j - 1;
end
