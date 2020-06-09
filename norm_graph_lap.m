function L = norm_graph_lap(W)
%computes the normalized graph laplacian of a similarity matrix W
%   Detailed explanation goes here

%degree matrix
D = diag(W*ones(size(W,2),1)-1);

%graph laplacian
L = eye(size(W,2)) - D^(-1/2)*W*D^(-1/2);

L = sparse(L);

end

