function [confusion_matrix, error_rate, wrongly_classified_indices,distances] = KNN_classifier(k,template_set,test_set, template_labels, test_labels, N_classes, distances)


N_test_set = size(test_set,1);                   % Number of test values

test_set = test_set';                            % Transpose test_set before using it in the dist()-function

if nargin < 7
    distances = dist(template_set,test_set);            % Calculates all distances 
    load train
    sound(y,Fs)
end

confusion_matrix = zeros(N_classes,N_classes);   % Allocate space for the confusion matrix
wrongly_classified_indices = [];

for i=1:N_test_set
    current_data = [distances(:,i) template_labels];
    sorted_data = sortrows(current_data,1);
    
    closest_classes = zeros(1,N_classes);
    for j=1:k
        closest_classes(sorted_data(j,2)+1) = closest_classes(sorted_data(j,2)+1)+1;
    end
    
    [maxVal,index] = max(closest_classes);
    
    classified_as = index-1;         
    actual_number = test_labels(i);
    
    confusion_matrix(actual_number+1, classified_as+1) = confusion_matrix(actual_number+1, classified_as+1)+1;

    
    if classified_as ~= actual_number
        wrongly_classified_indices = [wrongly_classified_indices;i actual_number classified_as];
    end
    
    
end

error_rate = (N_test_set-trace(confusion_matrix))/N_test_set;
    
load gong
sound(y,Fs)
    
    
