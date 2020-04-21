function [confusion_matrix, error_rate, wrongly_classified_indices,correctly_classified_indices,distances] = NN_classifier(template_set, test_set, template_labels, test_labels, N_classes, distances)

    N_test_set = size(test_set,1);                   % Number of test values
    test_set = test_set';                            % Transpose test_set before using it in the dist()-function
   
    if nargin < 6
        distances = dist(template_set,test_set);            % Calculates all distances 
        load train
        sound(y,Fs)
    end
    
    confusion_matrix = zeros(N_classes,N_classes);   % Allocate space for the confusion matrix
    wrongly_classified_indices = [];
    for i=1:N_test_set                               % Iterate through the number of tests
        
        [minValue,index] = min(distances(:,i));      % Here we find the index with the shortest distance, for test value i
        classified_as = template_labels(index);         
        actual_number = test_labels(i);
        
        confusion_matrix(actual_number+1, classified_as+1) = confusion_matrix(actual_number+1, classified_as+1)+1;
        
        if classified_as ~= actual_number
            wrongly_classified_indices = [wrongly_classified_indices;i actual_number classified_as];
        else 
            correctly_classified_indices = [correctly_classified_indices;i actual_number classified_as];
        end
    end

    error_rate = (N_test_set-trace(confusion_matrix))/N_test_set;
    load gong
    sound(y,Fs)
end
