% 1. Depth First Search (DFS) for 8-queens Problem
% 2. From wiki: https://en.wikipedia.org/wiki/Eight_queens_puzzle, we know
% there are 92 distinct solutions for 8x8 board queens.In order to avoid 
% symmetric solutions, this program provides 46 distinct solutions from 
% first 4 columns at first row!

clc,clear
node.placement = [0,0,0,0,0,0,0,0];
node.parentNode = [];
node.childNodes = [];
node.visit = 0;         % 0 is unvisited, 1 is visited
node.level = 0;         % use for working row

V = [];                 % use for visited set
S = node;               % use for stack
NumOptSln = 1;          % number of optimal solutions
while isempty(S) == 0
	node = S(length(S));
	S = S(1:length(S)-1);
	if node.visit == 0
		node.visit = 1;
		node.childNodes = FindChildNodes(node);
		if isempty(node.childNodes) == 0
			S = [S; node.childNodes];
        else
            NumOptSln = CheckFinalSolution(node, NumOptSln);
		end
    end
end
