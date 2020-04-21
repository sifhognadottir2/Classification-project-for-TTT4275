function [W,norm_nabla_W,nabla_W_MSE] = linearClassifier(data_set, T, W_0, alpha, iteration_max, tol)
% data_set: of size n_features x n_data
% T       : of size n_classes x n_data
% W_0     : initial guess for W, of size n_classes x n_features
% alpha   : step factor


if nargin < 5
        iteration_max = 100;
end

if nargin < 6
    tol = 1e-6;
end

%%% definere noe shit
n_features = size(data_set,1);
n_classes = size(T,1);
n_data = size(data_set,2);

W = W_0;
z = zeros(n_classes,n_data);
g = z;

iteration = 0;
norm_nabla_W = 1;
termination_criteria = (iteration > iteration_max) || (norm_nabla_W < tol);
while not(termination_criteria)
    
    for k=1:n_data
        z(:,k) = W*[data_set(:,k);1];
        for i=1:n_classes
            g(i,k) = 1/(1+exp(-z(i,k)));
        end
    end
    
    nabla_W_MSE = zeros(n_classes, n_features+1);
    
    for k=1:n_data 
        nabla_W_MSE = nabla_W_MSE + ((g(:,k)-T(:,k)).*g(:,k).*(ones(n_classes,1)-g(:,k)))*[data_set(:,k);1]';
    end
    W = W - alpha.*nabla_W_MSE;
    
    iteration = iteration + 1;
    norm_nabla_W = norm(nabla_W_MSE,1);
    termination_criteria = (iteration > iteration_max) || (norm_nabla_W < tol);
end

if iteration > iteration_max
    fprintf('Linear classifier reached maximum number of iterations');
end

if norm(nabla_W_MSE,1) < tol
    fprintf('Linear classifier reached tolerance level');
    disp(iteration);
end

