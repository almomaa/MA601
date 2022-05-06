function x = IHT(A, y, K)

% A: candidate functions matrix
% y: response (or output)
% K: Cardinality constrains (desired number of nin-zero entries in the
%    solution)

if nargin<3 || isempty(K)
    K = 1;
end

x = pinv(A)*y;

while sum(~~x)>K
    xhold = x;  xhold(~x) = inf;
    
    [~,pos] = min(abs(xhold));
    x(pos) = 0;
    
    ix = ~~x;
    
    x(ix) = pinv(A(:,ix))*y;
    
end
end

