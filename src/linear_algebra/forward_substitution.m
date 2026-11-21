
function x = forward_substitution(L, b)
% FORWARD_SUBSTITUTION Solve a lower triangular system.
%
%   x = forward_substitution(L, b) solves L*x = b.
%
% Inputs:
%   L - Lower triangular coefficient matrix.
%   b - Right-hand side column vector.
%
% Output:
%   x - Solution column vector.
%
% Author: Raul Galdeano Pazos
% Project: MATLAB Survival Toolbox

    validateattributes(L, {'double','single'}, ...
        {'2d','square','nonempty','finite'});

    n = size(L, 1);

    validateattributes(b, {'double','single'}, ...
        {'column','numel',n,'finite'});

    if ~istril(L)
        error('Toolbox:InvalidMatrix', ...
            'Matrix L must be lower triangular.');
    end

    if any(diag(L) == 0)
        error('Toolbox:SingularMatrix', ...
            'Matrix L contains a zero diagonal element.');
    end

    L = double(L);
    b = double(b);
    x = zeros(n, 1);

    for i = 1:n
        x(i) = (b(i) - L(i,1:i-1)*x(1:i-1)) ...
            / L(i,i);
    end

end
