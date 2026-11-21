
%% MATLAB Survival Toolbox
% Example: Solution of a linear system
% Module: Numerical Linear Algebra

clear;
clc;

% Locate toolbox source directory.
root = fileparts(fileparts(mfilename('fullpath')));
addpath(fullfile(root, 'src', 'linear_algebra'));

% Define the linear system.
A = [ 2,  1, -1;
     -3, -1,  2;
     -2,  1,  2];

b = [8; -11; -3];

% Custom numerical solver.
x_toolbox = gaussian_elimination(A, b);

% MATLAB reference solver.
x_reference = A\b;

% Numerical validation.
absolute_error = norm(x_toolbox - x_reference);
residual = norm(A*x_toolbox - b);

disp('Toolbox solution:');
disp(x_toolbox);

disp('MATLAB reference solution:');
disp(x_reference);

fprintf('Absolute error: %.3e\n', absolute_error);
fprintf('Residual norm: %.3e\n', residual);
