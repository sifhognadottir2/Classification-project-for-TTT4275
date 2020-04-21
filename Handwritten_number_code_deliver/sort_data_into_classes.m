function sorted_training_set = sort_data_into_classes(train_set,trainlab,n_classes)

sorted_training_set = cell(n_classes,1);
for i=1:size(train_set,1)
   sorted_training_set{trainlab(i)+1} = [sorted_training_set{trainlab(i)+1}; train_set(i,:)]; 
end
    
end

