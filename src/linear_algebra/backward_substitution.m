
function x = backward_substitution(U, b)
% BACKWARD_SUBSTITUTION Solve an upper triangular system.
%
%   x = backward_substitution(U, b) solves U*x = b.
%
% Inputs:
%   U - Upper triangular coefficient matrix.
%   b - Right-hand side column vector.
%
% Output:
%   x - Solution column vector.
%
% Author: Raul Galdeano Pazos
% Project: MATLAB Survival Toolbox

    validateattributes(U, {'double','single'}, ...
        {'2d','square','nonempty','finite'});

    n = size(U, 1);

    validateattributes(b, {'double','single'}, ...
        {'column','numel',n,'finite'});

    if ~istriu(U)
        error('Toolbox:InvalidMatrix', ...
            'Matrix U must be upper triangular.');
    end

    if any(diag(U) == 0)
        error('Toolbox:SingularMatrix', ...
            'Matrix U contains a zero diagonal element.');
    end

    U = double(U);
    b = double(b);
    x = zeros(n, 1);

    for i = n:-1:1
        x(i) = (b(i) - U(i,i+1:n)*x(i+1:n)) ...
            / U(i,i);
    end

end
