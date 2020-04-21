function [clusters, cluster_labels] = clustering(sorted_train_data, n_classes,M)

% sorted_train_data: n_classes x 1 cell array, where the training data is
% sorted by class
% M: Number of clusters
clusters = [];
cluster_labels = [];
for i=1:n_classes
    [idx_i,C_i]=kmeans(sorted_train_data{i},M);
    clusters = [clusters; C_i];
    cluster_labels = [cluster_labels;ones(M,1)*(i-1)];
    
end