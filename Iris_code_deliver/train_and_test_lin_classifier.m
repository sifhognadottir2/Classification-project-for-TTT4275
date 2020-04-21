function [W,conf_mat_train, error_rate_training,conf_mat_test,error_rate_testing] = train_and_test_lin_classifier(all_data,n_classes,n_training,n_testing, features_to_use_vec,use_last_data,alpha)
%   feature_to_use_vec decides which features to use, vector of size
%       n_classes, with values 1 on the index to use, ex [1,1,1,0]
%   use_last_data = 1 if use ex. last 30 data for training, and first 20
%   data for testing, =0 if first data is used for training.
if nargin < 7
        alpha = 2*10^-3;
end


% Getting the data ready:
n_features_all_data = size(all_data,1);
data = [];
for i =1:n_features_all_data
    if features_to_use_vec(i)==1
        data = [data;all_data(i,:)];
    end
end
n_features = size(data,1);

% Dividing the data into training and testing sets:
if use_last_data ==1
    [ data_testing, T_testing,data_training,T_training] = create_training_test_sets(data,n_classes,n_testing,n_training);

else
    [data_training,T_training, data_testing, T_testing] = create_training_test_sets(data,n_classes,n_training,n_testing);
end

% Training:
    W_0 = eye(n_classes,n_features+1);
    [W,norm_nabla_W,nabla_W_MSE] = linearClassifier(data_training, T_training, W_0, alpha,10000);
    [conf_mat_train, error_rate_training] = get_conf_mat(data_training, T_training, W);
    [conf_mat_test,error_rate_testing] = get_conf_mat(data_testing, T_testing, W);

end

