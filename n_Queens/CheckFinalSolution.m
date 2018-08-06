function NumOptSln = CheckFinalSolution(node, NumOptSln)

n = size(node.placement,2);
if node.placement(n) ~= 0
    fprintf('\n== %d optimal solutions are found ==\n', NumOptSln)
    NumOptSln = NumOptSln + 1;
    
    fprintf('The placement form is:\n')
    for i = 1:n
        fprintf('  %d ', node.placement(i))
    end
    fprintf('\n')
    
    fprintf('And the board form is:\n')
    board = zeros(n,n);
    for i = 1:n
        if node.placement(i) ~= 0
            board(i, node.placement(i)) = 1;
        end
    end
    for i = 1:n
        for j = 1:n
            fprintf('  %d ', board(i,j))
        end
        fprintf('\n')
    end
end