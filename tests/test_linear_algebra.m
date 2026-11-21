

function tests = test_linear_algebra
% TEST_LINEAR_ALGEBRA Unit tests for numerical solvers.
%
% Project: MATLAB Survival Toolbox

    tests = functiontests(localfunctions);

end

function setupOnce(testCase)

    root = fileparts(fileparts(mfilename('fullpath')));

    testCase.TestData.originalPath = path;

    addpath(fullfile(root, 'src', 'linear_algebra'));

end

function teardownOnce(testCase)

    path(testCase.TestData.originalPath);

end

%% TEST 01 — Gaussian elimination

function testGaussianElimination(testCase)

    A = [ 2,  1, -1;
         -3, -1,  2;
         -2,  1,  2];

    b = [8; -11; -3];

    actual = gaussian_elimination(A, b);
    expected = A\b;

    verifyEqual(testCase, actual, expected, ...
        'AbsTol', 1e-10);

    verifyLessThan(testCase, ...
        norm(A*actual - b), 1e-10);

end

%% TEST 02 — Forward substitution

function testForwardSubstitution(testCase)

    L = [2, 0, 0;
         3, 1, 0;
         1, 4, 2];

    b = [2; 5; 15];

    actual = forward_substitution(L, b);
    expected = L\b;

    verifyEqual(testCase, actual, expected, ...
        'AbsTol', 1e-10);

end

%% TEST 03 — Backward substitution

function testBackwardSubstitution(testCase)

    U = [2, 1, 3;
         0, 4, 1;
         0, 0, 2];

    b = [13; 11; 6];

    actual = backward_substitution(U, b);
    expected = U\b;

    verifyEqual(testCase, actual, expected, ...
        'AbsTol', 1e-10);

end

%% TEST 04 — Partial pivoting

function testPartialPivoting(testCase)

    A = [0, 2;
         1, 3];

    b = [4; 7];

    actual = gaussian_elimination(A, b);

    verifyEqual(testCase, actual, A\b, ...
        'AbsTol', 1e-10);

end

%% TEST 05 — Singular matrix detection

function testSingularMatrix(testCase)

    A = [1, 2;
         2, 4];

    b = [3; 6];

    verifyError(testCase, ...
        @() gaussian_elimination(A, b), ...
        'Toolbox:SingularMatrix');

end

%% TEST 06 — Invalid triangular matrix

function testInvalidTriangularMatrix(testCase)

    L = [1, 2;
         3, 4];

    b = [1; 2];

    verifyError(testCase, ...
        @() forward_substitution(L, b), ...
        'Toolbox:InvalidMatrix');

end

