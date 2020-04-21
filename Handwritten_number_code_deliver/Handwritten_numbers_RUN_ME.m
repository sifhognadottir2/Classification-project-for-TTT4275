% Run read09.m first to make the mat-file 'data_all.mat'
load('data_all.mat');
n_classes = 10;

%% Task 1
%Running this section can take over an hour
[confusion_matrix, error_rate, wrongly_classified_indices,correctly_classified_indices,distances] = NN_classifier(trainv, testv, trainlab, testlab, n_classes);

%% Task 2ab
%Running this section can also take some time, about 15 min
M = 64;
sorted_template_data = sort_data_into_classes(trainv,trainlab,n_classes);
[clusters, cluster_labels] = clustering(sorted_template_data, n_classes,M);
[confusion_matrix, error_rate,wrongly_classified_indices,distances_clustering] = NN_classifier(clusters, testv, cluster_labels, testlab, n_classes); 

%% Task 2c, run this if you already have run section: Task 1
K = 7;
%KNN_classifier with orignal data as templates
[confusion_matrix, error_rate, wrongly_classified_indices] = KNN_classifier(K,trainv,testv, trainlab,testlab, n_classes,distances);


%% Task 2c, run this if you have NOT run section: Task 1
K = 7;
%KNN_classifier with orignal data as templates
[confusion_matrix, error_rate, wrongly_classified_indices] = KNN_classifier(K,trainv,testv, trainlab,testlab, n_classes);
