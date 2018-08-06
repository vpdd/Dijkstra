function X = randomChooseHyperChild(HX,B)
% Input: 
%   - HX: orignally, it should be the collection of hyper-vertex. In
%   practice, or just for simplicity, HX in this program is equivalent to
%   SX, which is the set of next child vertex.
%   - B: limited budget. Choose |B| vertex in HX (or SX) at random, and
%   execute parallel expand the tree.
% Output:
%   - X: choose hyper-vertex from HX at random with budget B

if  numel(HX) <= B
    X = HX;
else
    tmp_ind = randperm(length(HX));
    index = sort(tmp_ind(1:B));
    X = HX(index);
end
