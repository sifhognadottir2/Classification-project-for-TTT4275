function [data_training,T_training, data_testing, T_testing] = create_training_test_sets(all_data,n_classes,size_training,size_testing)
%   size_training: number of data points per class
n_features = size(all_data,1);
%data_training = zeros(n_features,size_training*n_classes);
data_training = [];
%data_testing = zeros(n_features,size_testing*n_classes);
data_testing = [];

T_training = zeros(n_classes,size_training);
T_testing = zeros(n_classes,size_testing);
I = eye(n_classes,n_classes);
for i = 1:n_classes
    for j = 1: size_training
        %data_training(:,j+(i-1)*size_training) = all_data(:,(i-1)*(size_training+size_testing)+j);
        T_training(:,j+(i-1)*size_training)=I(:,i);
    end
    
    for j = 1:size_testing
        %data_testing(:,j+(i-1)*size_testing) = all_data(:,(i-1)*(size_training+size_testing)+j+size_training);
        T_testing(:,j+(i-1)*size_testing)=I(:,i);
    end
    
    
    data_training = [data_training all_data(:,[(i-1)*(size_training+size_testing)+1:(i-1)*(size_training+size_testing)+size_training])];
    
    data_testing = [data_testing all_data(:,[(i-1)*(size_training+size_testing)+1+size_training:(i-1)*(size_training+size_testing)+size_training+size_testing])];
    
    
    
end




end

