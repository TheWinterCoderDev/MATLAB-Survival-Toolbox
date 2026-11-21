
function x = gaussian_elimination(A, b)
% GAUSSIAN_ELIMINATION Solve a linear system using partial pivoting.
%
%   x = gaussian_elimination(A, b) solves A*x = b.
%
% Inputs:
%   A - Square coefficient matrix.
%   b - Right-hand side column vector.
%
% Output:
%   x - Solution column vector.
%
% Dependencies:
%   backward_substitution.m
%
% Author: Raul Galdeano Pazos
% Project: MATLAB Survival Toolbox

    validateattributes(A, {'double','single'}, ...
        {'2d','square','nonempty','finite'});

    n = size(A, 1);

    validateattributes(b, {'double','single'}, ...
        {'column','numel',n,'finite'});

    U = double(A);
    rhs = double(b);

    for k = 1:n-1

        % Select the largest available pivot.
        [~, relative_index] = max(abs(U(k:n,k)));
        pivot = relative_index + k - 1;

        if U(pivot,k) == 0
            error('Toolbox:SingularMatrix', ...
                'A zero pivot was encountered.');
        end

        % Exchange rows when necessary.
        if pivot ~= k
            U([k,pivot],:) = U([pivot,k],:);
            rhs([k,pivot]) = rhs([pivot,k]);
        end

        % Eliminate entries below the pivot.
        for i = k+1:n

            factor = U(i,k) / U(k,k);

            U(i,k:n) = U(i,k:n) ...
                - factor*U(k,k:n);

            U(i,k) = 0;

            rhs(i) = rhs(i) - factor*rhs(k);

        end

    end

    if any(diag(U) == 0)
        error('Toolbox:SingularMatrix', ...
            'The system contains a zero pivot.');
    end

    % Solve the resulting triangular system.
    x = backward_substitution(U, rhs);

end
