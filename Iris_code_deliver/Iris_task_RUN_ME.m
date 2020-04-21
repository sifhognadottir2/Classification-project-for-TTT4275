%% Setup for the classification
x1all = load('class_1','-ascii');
x2all = load('class_2','-ascii');
x3all = load('class_3','-ascii');

x1_data = x1all';
x2_data = x2all';
x3_data = x3all';

all_data = [x1_data x2_data x3_data];
n_classes = 3;
n_training = 30;
n_testing = (size(all_data,2))/n_classes-n_training;

%  Run each of the section below individually to test different variations. 
%% 1a-c:
features_to_use_vec = [1,1,1,1];
use_last_data = 0;
[W,conf_mat_train, error_rate_training,conf_mat_test,error_rate_testing] = train_and_test_lin_classifier(all_data,n_classes,n_training,n_testing, features_to_use_vec,use_last_data)

%% 1d
features_to_use_vec = [1,1,1,1];
use_last_data = 1;
[W,conf_mat_train, error_rate_training,conf_mat_test,error_rate_testing] = train_and_test_lin_classifier(all_data,n_classes,n_training,n_testing, features_to_use_vec,use_last_data)

%% 2a
features_to_use_vec = [1,0,1,1];
use_last_data = 0;
[W,conf_mat_train, error_rate_training,conf_mat_test,error_rate_testing] = train_and_test_lin_classifier(all_data,n_classes,n_training,n_testing, features_to_use_vec,use_last_data)

%% 2b.1:

features_to_use_vec = [0,0,1,1];
use_last_data = 0;
[W,conf_mat_train, error_rate_training,conf_mat_test,error_rate_testing] = train_and_test_lin_classifier(all_data,n_classes,n_training,n_testing, features_to_use_vec,use_last_data)


%% 2b.2

features_to_use_vec = [0,0,0,1];
use_last_data = 0;
[W,conf_mat_train, error_rate_training,conf_mat_test,error_rate_testing] = train_and_test_lin_classifier(all_data,n_classes,n_training,n_testing, features_to_use_vec,use_last_data)





